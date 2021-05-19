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

with open("../data/survey-pilot-3-EN.csv","w") as file:
     file.write(data)
