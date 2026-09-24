#__exeptions_base
#__python_ex105
#__zero_division_error

a = input("insert_number: ")
b = input("insert_other_number: ")
a = int(a)
b = int(b)

try:
    print(a/b)
except ZeroDivisionError:
    print("b_not_be_0")

#__python_ex110

try:
    10 / 0
    c = "i_not_were"
except ZeroDivisionError:
    print(c)