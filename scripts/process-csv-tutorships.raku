#!/usr/bin/env raku

use Text::CSV;

my @data = csv( in => "data/survey-student-interaction-2021.csv", headers => "auto");

my %keys;

for @data -> %d {

      my @features =
        %d{"¿Qué características valora en los medios informáticos de interacción con el estudiante?"}.split(/";"\s*/);

      for @features -> $f {
        given $f {
            when /familiaridad/ { %d<InteractionMediaFamiliarity> = "Yes" };
            when /formación/ { %d<InteractionMediaOfficialFormation> = "Yes" };
            when /unidireccional/ { %d<InteractionMediaUnidirecionality> = "Yes" };
            when /jerárquicos/ { %d<InteractionMediaHorizontality> = "Yes" };
            when /conexión/ { %d<InteractionMediaConnectivity> = "Yes" };
            when /añadir/ { %d<InteractionMediaPluggability> = "Yes" };
            when /ocultar/ { %d<InteractionMediaHiddenPhone> = "Yes" };
            when /preocupar/ { %d<InteractionMediaSustainability> = "Yes" };
            when /extraer/ { %d<InteractionMediaAnalytics> = "Yes" };
            default { %d<Other> = "Yes" }
        }
      }

      %d{"¿Qué características valora en los medios informáticos de interacción con el estudiante?"}:delete;
      %d{"Marca temporal"}:delete;
      my @degrees =
        %d{"Titulaciones que imparte"}.split(/";"\s*/);

      for @degrees -> $d {
          given $d {
              when /"Grado" $/ { %d<DegreesGraduate> = "Yes" };
              when /Máster/ { %d<DegreesMaster> = "Yes" };
              when /Ciclos/ { %d<DegreesVocational> = "Yes" };
              when /Mayores/ { %d<DegreesLifelong> = "Yes" };
              when /propios/ { %d<DegreesLocalDegrees> = "Yes" };
          }
      }

      say %d;
      %d{"Titulaciones que imparte"}:delete;
      for %d.keys -> $k {
          %keys{$k} = 1;
      }
}


my %headers = %( "Titulaciones que imparte" => "Degrees",
                 "Área" => "Discipline",
                 "Género" => "Gender",
                 "Edad (años)" => "Age",
                 "Experiencia docente" => "Experience",
                 "Prefiere la interacción con el estudiante" => "Interaction Synchrony (or not)",
                 "La interacción con el estudiante prefiere que se lleve a cabo" => "Interaction officiality" );

for @data -> %d {
    for %keys.keys -> $k {
        %d{$k} = "No" unless %d{$k};
    }
}

csv( in => @data, out => "data/survey-student-interaction-pilot-3-2021.csv",
        :%headers );

