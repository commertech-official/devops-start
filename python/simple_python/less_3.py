# Octotorp

print("No comment: quotes make the # harmless.")

# String continues

sum = 1 + \
    2+ \
    3+ \
    4

print(sum)

sum_1 = (
    1+
    2+
    3+
    4)

print(sum_1)

# If / then / else

disaster = True
if disaster:
    print("Woe!")
else:
    print("Whee!")

furry = True
large = True
if furry:
    if large:
        print("It`s a yeti.")
    else:
        print("It`s a cat!")
else:
    if large:
        print("It`s a whale!")
    else:
        print("It`s a human. Or a hairless cat/")

# If / elif / elseif

color = "mauve"
if color == "red":
    print("It`s a tomato")
elif color == "green":
    print("It`s a green pepper")
elif color == "bee purple":
    print("I don`t know what it is, but onle bees can see it")
else:
    print("I`ve never heard of the color", color)

# Comparison

x = 7
print(x)
t = x == 5
print(t)
z = 5 < x
print(z)
