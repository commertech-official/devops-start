#while_based

count = 1
while count <= 5:
    print(count)
    count += 1

#interrupt_break

while True:
    stuff = input("string to capitlize [type q to quit]:")
    if stuff == "q":
        break
    print(stuff.capitalize())

#operator_continue

while True:
    value = input("Integer, please [q to quit]:")
    if value == 'q': #exit
        break
    number = int(value)
    if number % 2 == 0: #odd_number
        continue
    print(number, "squared is", number*number)

#check_exit_cycle_help_else

numbers = [1,3,5]
position = 0
while position < len(numbers):
    number_1 = numbers[position]
    if number_1 % 2 == 0:
        print('Found even number', number_1)
        break
    position += 1
else: #break_not_call
    print('No even number found')
