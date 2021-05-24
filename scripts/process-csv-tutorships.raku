#!/usr/bin/env raku

use Text::CSV;

my @data = csv( in => "data/survey-student-interaction-2021.csv", headers => "auto");

my %keys;

for @data -> %d {

      my @features =
        %d{"¿Qué características valora en los medios informáticos de interacción con el estudiante?"}.split(/";"\s*/);

      for @features -> $f {
        given $f {
            when /familiaridad/ { %d<Familiarity> = "Yes" };
            when /formación/ { %d<OfficialFormation> = "Yes" };
            when /unidireccional/ { %d<Unidirecionality> = "Yes" };
            when /jerárquicos/ { %d<Horizontality> = "Yes" };
            when /conexión/ { %d<Connectivity> = "Yes" };
            when /añadir/ { %d<Pluggability> = "Yes" };
            when /ocultar/ { %d<HiddenPhone> = "Yes" };
            when /preocupar/ { %d<Sustainability> = "Yes" };
            when /extraer/ { %d<Analytics> = "Yes" };
            default { %d<Other> = "Yes" }
        }
      }

      %d{"¿Qué características valora en los medios informáticos de interacción con el estudiante?"}:delete;
      %d{"Marca temporal"}:delete;

      my @degrees =
        %d<Degrees>.split(/";"\s*/);

      for @degrees -> $d {
        given $d {
            when /Grado/ { %d<Graduate> = "Yes" };
            when /Máster/ { %d<Master> = "Yes" };
            when /Ciclos/ { %d<Vocational> = "Yes" };
            when /Mayores/ { %d<Lifelong> = "Yes" };
            when /propios/ { %d<LocalDegrees> = "Yes" };
        }
      }

      %d<Degrees>:delete;
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

