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

#__homework

#__task_1_number_func
#__функция принимает число в качестве ввода, возводит её в квадрат и возвращает:

def sqr_1 ():
    l_1 = input("input_nubmber: ")
    l_1 = int(l_1)
    l_1 *= l_1
    print(l_1)

print(sqr_1())

def sqr_2 (num):
    return num ** 2

n_n = int(input("input_number_2:"))
print(sqr_2(n_n))

#__task_2_string_func
#__функция троку в качестве аргумента и возвращает его:

def str_1 (str):
    return str

n_t = str(input("input_string:"))
print(str_1(n_t))

#__task_3_param
#__функция которая принимает 2 обазятельных и 3 необязательных аргумента:

def param_1 (di, le, ma=3, ze=5, je=7):
    return di + le + ma + ze + je

print(param_1(2, 4))

#__task_4_two_func
#__функция принимающая целое число и возвращает результат от деления этого числа на 2, следующая функция берет это число  и умножает его на 4:

def func_num_del_2 (num_1):
    return num_1 / 2

ser = int(input("input_number_del_2:"))
next_cycle = func_num_del_2(ser)

def func_num_umn_4 (num_2):
    return num_2 * 4

next_cycle_2 = func_num_umn_4(next_cycle)
print(next_cycle_2)

#__task_5_float_trans
#__функция преобразующая строку в вещественое число с обработкой исключений:

def trans_float (str_float):
    try:
      return float(str_float)
    except ValueError:
      print("its not number")
      return None

ser_x = str(input("input_number_trans_float:"))
print(trans_float(ser_x))