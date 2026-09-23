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

#__more_use_def

#__python_ex094

def even_odd(x_2):
    if x_2 % 2 == 0:
        print("even")
    else:
        print("odd")

even_odd(2)
even_odd(3)

#__python_ex096

def even_odd_odd():

    n_1 = input("insert_number: ")
    n_1 = int(n_1)

    if n_1 % 2 == 0:
        print("n_1 - even")
    else:
        print("n_1 - odd")

even_odd_odd()
even_odd_odd()
even_odd_odd()

#__optional_and_none_optionals_param

#__python_ex097
#__none_optional_param

def f_1(x_3 = 2):
    return x_3**x_3
print(f_1())
print(f_1(4))

#__python_ex098

def add_it(x_4, y_4=10):
    return x_4 + y_4

result = add_it(2)
print(result)

#__python_ex100
#__global_param

x_5 = 1
y_5 = 2
z_5 = 3

def f_5():
    print(x_5)
    print(y_5)
    print(z_5)
f_5()

#__python_ex101
#__global_param
#__nameerror:name_x_is_not_defined

#def f_6():
#    x_6 = 1
#    y_6 = 2
#    z_6 = 3

#print(x_6)
#print(y_6)
#print(z_6)
#f_6()

#__python_ex102
#__global_param

def f_7():
    x_7 = 1
    y_7 = 2
    z_7 = 3
    print(x_7)
    print(y_7)
    print(z_7)
f_7()

#__python_ex104

x_8 = 100

def f_8():
    global x_8
    x_8 += 1
    print(x_8)
f_8()