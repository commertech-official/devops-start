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

if 5 < x and x < 10:
    print("(5<x and x<10) The X = ", x)

r = 11

if 5 < r or r < 10:
    print("(5<r or r>10) The R = ", r)

if 5 < x and x > 10:
    print("(5<x and x>10) The X = ", x)

# if 5 < x not and x > 10:
#     print("(5<x andnot x>10) The X = ", x)

some_list = []
if some_list:
    print("There`s something in here")
else:
    print("Hey, it`s empty")

letter = 'o'
if letter == 'a' or letter == 'e' or letter == 'i'\
or letter == 'o' or letter == 'u':
    print(letter,'is a vowel')
else:
    print(letter, 'is not a vowel')

vowels = 'aeiou'
letter in vowels
if letter in vowels:
    print(letter, 'is a vowel')

letter = 'o'
vowel_set = {'a','e','i','o','u'}
print(letter in vowel_set)
vowel_list = ['a','e','i','o','u']
print(letter in vowel_list)
vowel_tuple = ('a','e','i','o','u')
print(letter in vowel_tuple)
vowel_dict = {'a':'apple','e':'elephant','i':'impala','o':'ocelot','u':'unicorn'}
print(letter in vowel_dict)
vowel_string = 'aeiou'
print(letter in vowel_string)

# Operator ':='

tweet_limit = 280
tweet_string = "Blah"*50
if diff := tweet_limit-len(tweet_string)>=0:
  print("A fitting tweet", diff, len(tweet_string))
else:
  print("Went over by", abs(diff))

# Exercises

secret = 8
guess = 4
if guess < 7:
  print("toolow")
elif guess > 7:
  print("toohigh")
elif guess == secret:
  print("justright")
else:
  print("What?")

small = False
green = False
if small and  green:
    print("Goroshek")
elif not small and  green:
   print("Arbuz")
elif not small and not green:
  print("Tykva")
else:
  print("Strawberry")
