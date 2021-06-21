data = ""

with open("survey-student-interaction-pilot-3-2021.csv") as file:
     data = file.read()

#Binary (Yes/No)
data = data.replace("Yes", "1")
data = data.replace("No", "2")

#Age
data = data.replace("25-35", "1")
data = data.replace("35-45", "2")
data = data.replace("45-55", "3")
data = data.replace("Más de 55", "4")

#Experience 
data = data.replace("0-5 años", "1")
data = data.replace("5-15 años", "2")
data = data.replace("15-25 años", "3")
data = data.replace("más de 25 años", "4")

#Gender
data = data.replace("Hombre", "1") #Male
data = data.replace("Mujer", "2") #Female
data = data.replace("Prefiero no decirlo", "3") #Prefer not to say

#Discipline
data = data.replace("Biosanitaria", "1") #Biomedicine
data = data.replace("Ciencias Sociales", "2") #Social Sciences
data = data.replace("Ciencias", "3") #Sciences 
data = data.replace("Humanidades", "4") #Humanities
data = data.replace("Tecnología/Ingeniería", "5") #Tech/Engineering

#Interaction
data = data.replace("Asíncrona: el estudiante puede preguntar en cualquier momento, el profesorado contesta cuando puede.", "1") #Asynchronous: the students asks anytime and teachers replies when possible
data = data.replace("Síncrona: estudiantes(s) y profesor(es) en el mismo espacio, simultáneamente.", "2") #Synchronous: students and teachers in the same room, simultaneously

#Interaction Officiality: How the teacher-student interaction can happen
data = data.replace('"','')
data = data.replace("Por medios oficiales: visitas al despacho, foros/mensajes en el campus virtual, correo electrónico corporativo", "1") #By official means: visiting the teacher's office, messages via the virtual campus, or email" 
data = data.replace("Admite el uso de medios extraoficiales: blogs, grupos en programas de mensajería, otros medios", "2") #The teacher admits extraofficial means: blogs, groups in messaging appications, or others


with open("survey-student-interaction-pilot-3-2021-parsed.csv","w") as file:
     file.write(data)
