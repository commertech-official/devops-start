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

import webbrowser

import json
from urllib.request import urlopen
print("Let's find an old website.")
site = input("Type a website URL: ")
era = input("Type a year, month, and day, like 20150613: ")
url = "" % (site, era)
response = urlopen(url)
contents = response.read()
text = contents.decode("utf-8")
data = json.loads(text)
try:
old_site = data["archived_snapshots"]["closest"]["url"]
print("Found this copy: ", old_site)
print("It should appear in your browser now.")
webbrowser.open(old_site)
except:
print("Sorry, no luck finding", site)
