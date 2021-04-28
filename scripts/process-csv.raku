#!/usr/bin/env raku

use Text::CSV;

my @data-u = csv( in => "data/encuesta-edubots-uni.csv", headers => "auto");
my @data-c  = csv( in => "data/encuesta-edubots-ciclos.csv",  headers => "auto");


@data-u.map: { $_<Sector> = "University" };
@data-c.map: { $_<Sector> = "Vocational" };
@data-c.map: { $_{"¿Imparte docencia en ciclos formativos de grado medio o superior?"}:delete };

my @data = [ | @data-u, |@data-c ];

my %keys;

for @data -> %d {
    if  %d{"¿Qué plataforma de mensajería GRUPAL usas normalmente para comunicarte con tus compañeros y estudiantes?"} {
      %d{"¿Qué plataforma de mensajería GRUPAL usas normalmente para comunicarte con tus compañeros y estudiantes?"}
        ~~ s/" específica de la universidad, titulación o departamento"//;
      %d{"¿Qué plataforma de mensajería GRUPAL usas normalmente para comunicarte con tus compañeros y estudiantes?"}
        ~~ s/"Ninguna, prefiero"/Ninguna prefiero/;

      my @platforms =
        %d{"¿Qué plataforma de mensajería GRUPAL usas normalmente para comunicarte con tus compañeros y estudiantes?"}.split(/","\s+/);

      for @platforms -> $p {
        given $p {
            when /Whatsapp/ { %d<WhatsApp> = 1 };
            when /Telegram/ { %d<Telegram> = 1 };
            when /lataforma/ { %d<Provided> = 1 };
            when /Ninguna/ { %d<None> = 1 };
            when /Slack/ { %d<Slack> = 1 };
            default { %d<Other> = 1 }
        }
      }
}
    %d{"¿Qué plataforma de mensajería GRUPAL usas normalmente para comunicarte con tus compañeros y estudiantes?"}:delete;

    if  %d{"¿Qué tipo de bots (programas que respondan automáticamente a preguntas u órdenes)  podrían resultar útiles para mejorar los resultados de aprendizaje de los estudiantes o ayudarte, en general, a gestionar una asignatura?"} {
      %d{"¿Qué tipo de bots (programas que respondan automáticamente a preguntas u órdenes)  podrían resultar útiles para mejorar los resultados de aprendizaje de los estudiantes o ayudarte, en general, a gestionar una asignatura?"}
        ~~ s/"por ejemplo,"/""/;

      my @bots =
        %d{"¿Qué tipo de bots (programas que respondan automáticamente a preguntas u órdenes)  podrían resultar útiles para mejorar los resultados de aprendizaje de los estudiantes o ayudarte, en general, a gestionar una asignatura?"}.split(/","\s+/);

      for @bots -> $b {
        given $b {
            when /agenda/ { %d<Agenda> = 1 };
            when /frecuentes/ { %d<FAQ> = 1 };
            when /notas/ { %d<Grades> = 1 };
            when /material/ { %d<ClassMaterial> = 1 };
            default { %d<OtherBot> = 1 }
        }
      }
    }
    %d{"¿Qué tipo de bots (programas que respondan automáticamente a preguntas u órdenes)  podrían resultar útiles para mejorar los resultados de aprendizaje de los estudiantes o ayudarte, en general, a gestionar una asignatura?"}:delete;

    for %d.keys -> $k {
        %keys{$k} = 1;
    }
}


my %headers = %( "Titulaciones que imparte" => "Degrees",
                 "Área" => "Discipline",
                 "Género" => "Gender",
                 "Edad (años)" => "Age",
                 "Experiencia docente" => "Experience",
                 "Sobre el uso de los sistemas de mensajería en clase, prefiero" => "Messaging Organization",
                 "La virtualización de la enseñanza debida al COVID este año o el anterior, ¿ha significado algún cambio en tu percepción o uso de mensajería en clase?" => "PostCOVID changes" );

for @data -> %d {
    for %keys.keys -> $k {
        %d{$k} = 0 unless %d{$k};
    }
}

csv( in => @data, out => "data/survey-pilot-3.csv", :%headers );

