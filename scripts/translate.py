data = ""

with open("../data/survey-pilot-3.csv") as file:
     data = file.read()

#Age
data = data.replace("Más de 55", "> 55")

#Experience 
data = data.replace("0-5 años", "0-05 years")
data = data.replace("5-15 años", "06-15 years")
data = data.replace("15-25 años", "16-25 years")
data = data.replace("más de 25 años", "> 25 years")

#Gender
data = data.replace("Hombre", "Male")
data = data.replace("Mujer", "Female")
data = data.replace("Prefiero no decirlo", "PNTS")

#Discipline
data = data.replace("Biosanitaria", "Biomedicine")
data = data.replace("Ciencias Sociales", "Social Sciences")
data = data.replace("Ciencias", "Sciences")
data = data.replace("Humanidades", "Humanities")
data = data.replace("Ingeniería", "Engineering")
data = data.replace("Tecnología", "Technology")

#PostCOVID Changes
data = data.replace("No, antes la usaba y ahora la sigo usando.", "No, I did use it before, and use it now")
data = data.replace("Sí, antes no usaba ningún tipo de plataforma de mensajería y ahora sí la uso.", "Yes, I didn't use any messaging app before, but do use it now")
data = data.replace("Sí, he cambiado de plataforma de mensajería a otras más seguras.", "Yes, I use a safer messaging app now")
data = data.replace("No, no la usaba antes ni ahora.", "No, I didn't use it before, and don't use it now")


#Messaging.Organization
data = data.replace("Prefiero que los estudiantes se autoorganicen y no estar en ningún grupo de mensajería", "I'd rather leave students self-organize and not be part of the chat")
data = data.replace("Un grupo con los estudiantes de mi asignatura", "A chat with my students in the same course")
data = data.replace("Un grupo para el curso completo (profesores y estudiantes)", "A chat with all students and teachers in the same semester/year")
data = data.replace("Un grupo para toda la titulación o instituto (profesores y estudiantes)", "A chat with all the students and teachers in the same studies (all years)")
data = data.replace("Un grupo para toda la titulación, Facultad o Escuela (profesores y estudiantes)", "A chat with all the students and teachers in my Faculty/School")


#Degrees
data = data.replace("Grado", "Undergrad")
data = data.replace("Máster", "Master")
data = data.replace("Doctorado", "PhD")
data = data.replace("Títulos propios", "Non-official degree")

with open("../data/survey-pilot-3-EN.csv","w") as file:
     file.write(data)

data = ""

with open("../data/survey-student-interaction-pilot-3-2021.csv") as file:
     data = file.read()

#Age
data = data.replace("Más de 55", "> 55")

#Experience 
data = data.replace("0-5 años", "0-05 years")
data = data.replace("5-15 años", "06-15 years")
data = data.replace("15-25 años", "16-25 years")
data = data.replace("más de 25 años", "> 25 years")

#Gender
data = data.replace("Hombre", "Male")
data = data.replace("Mujer", "Female")
data = data.replace("Prefiero no decirlo", "PNTS")

#Discipline
data = data.replace("Biosanitaria", "Biomedicine")
data = data.replace("Ciencias Sociales", "Social Sciences")
data = data.replace("Ciencias", "Sciences")
data = data.replace("Humanidades", "Humanities")
data = data.replace("Tecnología/Ingeniería", "Tech/Engineering")

#Interaction
data = data.replace("Asíncrona: el estudiante puede preguntar en cualquier momento, el profesorado contesta cuando puede.", "Asynch.")
data = data.replace("Síncrona: estudiantes(s) y profesor(es) en el mismo espacio, simultáneamente.", "Synch.")

#Interaction Officiality
data = data.replace('""oficiales""', "oficiales")
data = data.replace('""corporativo""', "corporativo")
data = data.replace('""extraoficiales""', "extraoficiales")
data = data.replace("Por medios oficiales: visitas al despacho, foros/mensajes en el campus virtual, correo electrónico corporativo", "By official means: office hours, messages in the official virtual campus, or email")
data = data.replace("Admite el uso de medios extraoficiales: blogs, grupos en programas de mensajería, otros medios", "Admits additional means: blogs, messaging apps, others")


with open("../data/survey-student-interaction-pilot-3-2021-EN.csv","w") as file:
     file.write(data)
