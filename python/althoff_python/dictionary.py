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