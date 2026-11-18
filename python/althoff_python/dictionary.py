#__python_ex142
#__test_dict

fruits = {"apple":
          "red",
          "banana":
          "yellow"}

print(fruits)

#__python_ex143
#__test_dict_2

fact = dict()

# add a value
fact["code"] = "fanny"
# look up a key
print(fact["code"])

# add a value
fact["bill"] = "gates"
# look up a key
print(fact["bill"])

# add a value
fact["main"] = 1776
# look up a key
print(fact["main"])

#__python_ex144
#__check_dict

bill = dict({"Bill Gates":"microsoft"})
print("Bill Gates" in bill)

bill = dict({"Bill Gates":"microsoft"})
print("Bill Norze" not in bill)

#__python_ex145
#__del_dict

books = {"dracula":"stoker",
         "1984":"oruell",
         "process":"kafka"}

del books["process"]
print(books)


#__python_ex146
#__program_dict

rhymes = {"1":"laugh",
          "2":"blue",
          "3":"i am",
          "4":"stage",
          "5":"life"}

n = input("insert number:")
if n in rhymes:
    rhyme = rhymes[n]
    print(rhyme)
else:
    print("not found")

#__python_ex147
#__program_dict

lists = []
rap = ["Basta",
       "Crafc",
       "Zloy duh",
       "25-17"]

rock = ["Amatory",
       "Kino",
       "Aria"]

djs = ["Paul Oakenfold",
       "Tiesto"]

lists.append(rap)
lists.append(rock)
lists.append(djs)

print(lists)

rap = lists[0]
print(rap)

rap = lists[0]
rap.append("Nashe delo")
print(rap)
print(lists)

#__python_ex150
#__program_dict

locations = []

tula = (54.1960, 37.6182)
moscow = (55.7522, 37.6155)

locations.append(tula)
locations.append(moscow)

print(locations)

#__python_ex151
#__program_dict

eights = ["Alan Po", "Charlz Dickens"]
nines  = ["Hemenguei", "Fitzjerald", "Oruell"]

authors = (eights, nines)
print(authors)

#__python_ex152
#__program_dict

bday = {"Hemenguei":"21.07.1899","Fitzjerald":"24.09.1896"}

my_list = [bday]
print(my_list)
my_tuple = (bday,)
print(my_tuple)

#__python_ex153
#__program_dict

ru = {"loc":(55.7522,37.6155),
      "man":["Andrey Zvagincev","Yru Bykov","Petr Buslov"],
      "facts":{"city":"Moscow", "country":"Russia"}}

#__homework
#__task_1_list_lover_musicians

list_musician = ["Slipknot","Archgoat","Mayhem","Burzum","Avsky"]
print(list_musician)

#__task_2_cortezh
spare = [("spare_1", 55.7522, 37.6155),
         ("spare_2", 45.7843, 87.2525),
         ("spare_3", 65.7873, 46.2505)]
print(spare)

#__task_2_dicitionary_of_me
of_me = {"name": "dial",
         "rost": "180",
         "love_color": "black",
         "love_actor": "rivz"}
print(of_me)