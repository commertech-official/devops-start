#__python_ex130
#__container_changed

colors = ["magenta","orange","green"]
guess = input("what is it a color?")

if guess in colors:
    print("correct!")
else:
    print("not correct, try please!")

#__tuples
#__python_ex130

rndm = ("M.Jackson",1958,True)
print(rndm)
print(rndm[2])
print("1959" not in rndm)