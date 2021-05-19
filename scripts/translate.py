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


with open("../data/survey-pilot-3-EN.csv","w") as file:
     file.write(data)
