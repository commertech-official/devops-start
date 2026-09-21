#__functions_core
#__python_ex079

def f(x):
    return x *2
x = 2
print(f(x))

#__ключевое слово def -- сообщает языку, что мы определяем функцию, после указываем имя функции.
#__нельзя начинать имя функции с большой буквы, отдельны слова только через нижние подчеркивания
#__python_ex081

result = f(10)
print(result)

#__python_ex082

def g(y):
    return y + 1

z = g(4)
print(z)

if z == 5:
    print("z = 5")
else:
    print("z != 5")

#__python_ex083

def q():
    return 1 + 1

result = q()
print(result)

#__python_ex084

def w(e, r, t):
    return e + r + t

result = w(1, 2, 3)
print(result)

#__python_ex085

def w_1():
    z_1 = 1 + 1

result = w_1()
print(result)

#__intagrated_func

print(len("Monti"))
print(len("Python"))
print(str(100))
print(int("1"))
print(float(100))
print(int("110"))
print(int(20.54))
print(float("16.4"))
print(float(99))

#__python_ex093

age = input("input_you_age:")
int_age = int(age)
if int_age < 21:
    print("you_are_yong")
else: 
    print("you_are_old")