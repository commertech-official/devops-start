# Output of the value via the array index

spells = ["Ridikkulus", "Wingardium Leviosa", "Avada Kedavra", "Expecto Patronum", "Nox", "Lumos",]
print(spells[3])

quotes = {"Moe":"A wise guy, huh?",
          "Larry":"Ow!",
          "Curly":"Nyuk nyuk!", 
   }

stooge = "Curly"
print(stooge, "says:", quotes[stooge])

# Archive

#import webbrowser

#import json
#from urllib.request import urlopen
#print("Let's find an old website.")
#site = input("Type a website URL: ")
#era = input("Type a year, month, and day, like 20150613: ")
#url = "" % (site, era)
#response = urlopen(url)
#contents = response.read()
#text = contents.decode("utf-8")
#data = json.loads(text)
#try:
#old_site = data["archived_snapshots"]["closest"]["url"]
#print("Found this copy: ", old_site)
#print("It should appear in your browser now.")
#webbrowser.open(old_site)
#except:
#print("Sorry, no luck finding", site)

# Types

print(type(7))
print(isinstance(7,int))

a = 7
b = a

print(type(a))
print(type(b))
print(type(58))
print(type(99.9))
print(type('abc'))

# Assigment

x = 5
print("X assigment 5")
print(x)
y = x
print("X assigmnet Y")
print(y)
x = 29
print("X assigment 29")
print(x)
print("Y value")
print(y)

# Exercises

# 1

prince = 99
print(prince)

# 2

print(type(5))

# 3

print(type(2.0))

# 4

print(type(5+2.0))
