# Work with quotation marks

# Usage various types of quotation marks

print('Usage various types of quotation marks')
print('Give',"us",'''some''',"""space""")

# Creating strings using the function str()

print('result str(98,6) =', str(98.6))
print('result str(1.0e4) =', str(1.0e4))
print('result str(True) =', str(True))

# Creating strings with \n

print("'Guten Morgen, mein Herr!'\nsaid mad king Ludwig to his wig.")

# Escape sequences

palindrome = 'A man,\nA plan,\nA canal,\nPanama'
print(palindrome)

print('\tabc')
print('a\tbc')
print('ab\tc')
print('abc\t')

testimony = "\"I did nothing!\" he said. \"Or that other thing.\""
print(testimony)

fact = "The world's largest rubber duck was 54'2\" by 65'7\" by 105'"
print(fact)

speech = 'The backslash (\\) bends over backwards to please you.'
print(speech)

info = r'Type a \n to get a new line in a normal string'
info

poem = r'''Boys and girls, come out to play. The moon doth shine as bright as day.'''
print(poem)

# United strings with symbol "+"

a_1 = 'Duck.'
b_1 = a_1
c_1 = 'Grey Duck!'

print(a_1, b_1, c_1)
print(a_1,b_1,c_1)

# We multiply strings using the * symbol

start_1 = 'Na'*4+'\n'
middle_1 = 'Hey'*3+'\n'
end_1 = 'Goodbye.'

print(start_1 + start_1 + middle_1 + end_1)

# Extract sybmols with []

# If you specify an offset equal to or greater than the length of the string (remember, offsets go from 0 to length – 1), an exception will be generated:

letter_1 = '1234567890'
print(letter_1[2], letter_1[4], letter_1[6], letter_1[-1])

# Extracting substrings using splitting

print(letter_1[:])
print(letter_1[9:])
print(letter_1[1:4])
print(letter_1[-3:])
print(letter_1[3:-1])
print(letter_1[::2])
print(letter_1[1:8:2])
print(len(letter_1))

tasks_2 = 'get gloves,get mask,give cat vitamins,call ambulance'
print(tasks_2.split(','))

# В предыдущем примере строка имела имя tasks, а строковая функция называлась split() и имела один аргумент-разделитель ','. 
# Если вы не укажете разделитель, функция split() будет использовать любую последовательность пробелов, а также символы новой строки и табуляцию:
# >>> tasks.split()
# ['get', 'gloves,get', 'mask,give', 'cat', 'vitamins,call', 'ambulance']
# При вызове функции split без аргументов круглые скобки все равно надо ставить — именно так Python понимает, что вы вызываете функцию.

print(tasks_2.split())

# Объединяем строки с помощью функции join()

# Легко догадаться, что функция join() является противоположностью функции split(): она объединяет список строк в одну строку. 
# Вызов функции выглядит немного запутанно, поскольку сначала вы указываете строку, которая объединяет остальные, а затем — список строк для объединения: string.join(list). 
# Таким образом, чтобы объединить строки списка lines, разделенные символами новой строки, вам нужно написать '\n'.join(lines). В следующем примере мы объединим в список несколько имен, разделив их запятыми и пробелами:

# >>> crypto_list = ['Yeti', 'Bigfoot', 'Loch Ness Monster']
# >>> crypto_string = ', '.join(crypto_list)
# >>> print('Found and signing book deals:', crypto_string)

# Found and signing book deals: Yeti, Bigfoot, Loch Ness Monster

tasks_3 = ['white', 'green', 'grey', 'blue']
tasks_3_join = ','.join(tasks_3)
print('Join two strings:', tasks_3)

# Заменяем символы с использованием функции replace()
# Функция replace() предназначена для замены одной подстроки другой. 
# Вы указываете старую подстроку, новую подстроку и то, сколько экземпляров старой подстроки нужно заменить. 
# Если вы пропустите последний аргумент, функция заменит все экземпляры.

tasks_replace = "my name is Hanry, i am from USA"
tasks_replace = tasks_replace.replace('Hanry','Billy')
print(tasks_replace)

# Здесь заменим до 100 экземпляров:

tasks_replace = tasks_replace.replace('i','I',100)
print(tasks_replace)

# >>> setup = "a duck goes into a bar..."
# >>> setup.replace('duck', 'marmoset')
# 'a marmoset goes into a bar...'
# >>> setup
# 'a duck goes into a bar...'

# Здесь заменим до 100 экземпляров:
# >>> setup.replace('a ', 'a famous ', 100)
# 'a famous duck goes into a famous bar...'

# Если вы точно знаете, какую подстроку или подстроки хотите заменить, функция replace() окажется для вас хорошим выбором. 
# Но будьте осторожны: если бы во втором примере вы заменили строку из одного символа 'а', а не строку из двух символов 'а' (после а идет пробел), символы 'а' заменились бы и в середине слов:

# >>> setup.replace('a', 'a famous', 100)
# 'a famous duck goes into a famous ba famousr...'
# Иногда вам нужно убедиться в том, что подстрока является целым словом, началом слова и т.п. В такой ситуации понадобятся регулярные выражения.

# Устраняем символы с помощью функции strip()

# Нередко требуется убрать из строки начальные или конечные символы отступа, чаще всего пробелы. 
# Представленная здесь функция strip() подразумевает, что вы хотите избавиться от символов-пробелов ('', '\t', '\n'), если только вы не предоставите ей аргумент. 
# Функция strip() удаляет символы с обоих концов строки, lstrip() — только в начале, а rstrip() — только в конце. Давайте представим, что строковая переменная world содержит строку earth, окруженную пробелами:

tasks_strip = " earth "
tasks_strip = tasks_strip.strip()
print(tasks_strip)
tasks_strip = tasks_strip.strip('')
print(tasks_strip)
tasks_strip = tasks_strip.lstrip()
print(tasks_strip)
tasks_strip = tasks_strip.rstrip()
print(tasks_strip)
tasks_strip = tasks_strip.strip('!')
print(tasks_strip)

# Кроме отсутствия аргумента (когда подразумевается, что нужно найти пробелы) или отдельного символа, возможна и ситуация, когда функция strip() удалит все символы из последовательности:

tasks_strip_1 = "what the...!!?"
tasks_strip_1 = tasks_strip_1.strip('.!?')
print(tasks_strip_1)

# В приложении Д представлены отдельные определения групп символов, которые можно использовать для передачи в функцию strip():

# >>> import string
# >>> string.whitespace
# ' \t\n\r\x0b\x0c'

# >>> string.punctuation
# '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'

# >>> blurt = "What the...!!?"
# >>> blurt.strip(string.punctuation)
# 'What the'

# >>> prospector = "What in tarnation ...??!!"
# >>> prospector.strip(string.whitespace + string.punctuation)
# 'What in tarnation'

# Python содержит большой набор функций для работы со строками. Рассмотрим принцип работы самых распространенных из них. 
# Тестовым объектом станет следующая строка, содержащая текст бессмертного стихотворения «What Is Liquid?» Маргарет Кавендиш, герцогини Ньюкасл:

poem_find = '''All that doth flow we cannot liquid name
Or else would fire and water be the same;
But that is liquid which is moist and wet
Fire that property can never get.
Then 'tis not cold that doth the fire put out
But 'tis the wet that makes it die, no doubt.'''

# Для начала получим первые 13 символов (их смещения лежат в диапазоне от 0 до 12):

print(poem_find[:13])

# Сколько символов содержит это стихотворение? (Пробелы и символы новой строки учитываются.)

print(len(poem_find))

# Начинается ли стихотворение с All?

print(poem_find.startswith('All'))

# Заканчивается ли оно фразой That’s all, folks!?

print(poem.endswith('That\'s all, folks!'))

# В Python есть два метода поиска смещения подстроки — find() и index(). У каждого метода имеется возможность начинать поиск или с начала, или с конца. 
# В случае если подстрока присутствует в строке, они работают одинаково. Если подстрока не найдена, метод find() возвращает −1, а метод index() генерирует исключение.

# Найдем смещение первого появления в стихотворении слова the:

word_setpoint = 'the'
print(poem_find.find(word_setpoint))
print(poem_find.index(word_setpoint))

# А теперь — последнего:

word_setpoint = 'the'
print(poem_find.rfind(word_setpoint))
print(poem_find.rindex(word_setpoint))

# Но что, если подстроки нет?

word_setpoint = "duck"
print(poem_find.find(word_setpoint))
print(poem_find.rfind(word_setpoint))

# print(poem_find.index(word_setpoint))
# Traceback (most recent call last):
# File "<stdin>", line 1, in <module>
# ValueError: substring not found

# print(poem_find.rfind(word_setpoint))
# >>> poem.rindex(word)
# Traceback (most recent call last):
# File "<stdin>", line 1, in <module>
# ValueError: substring not found

# Сколько раз встречается трехбуквенное сочетание the?

word_setpoint = 'the'
print(poem_find.count(word_setpoint))

# Являются ли все символы в стихотворении буквами или цифрами?

print(poem_find.isalnum())

# Нет, в стихотворении имеются еще и знаки препинания.

# Регистр
# В этом разделе мы рассмотрим еще несколько примеров использования встроенных функций. В качестве тестовой выберем следующую строку:

setup_reg = 'a duck goes into a bar...'

# Удалим символ . с обоих концов строки:

setup_reg_1 = setup_reg.strip('.')
print(setup_reg_1)

# Поскольку строки неизменяемы, ни в одном из этих примеров строка setup_reg на самом деле не изменяется. 
# Просто берется значение переменной setup_reg, над ним выполняется некоторое действие, а затем результат возвращается в виде новой строки.

# Напишем первое слово с большой буквы:

setup_reg_1 = setup_reg.capitalize()
print(setup_reg_1)

# Напишем все слова с большой буквы:

setup_reg_1 = setup_reg.title()
print(setup_reg_1)

setup_reg_1 = setup_reg.upper()
print(setup_reg_1)

setup_reg_1 = setup_reg.lower()
print(setup_reg_1)

setup_reg_1 = setup_reg.swapcase()
print(setup_reg_1)

setup_reg_1 = setup_reg.center(30)
print(setup_reg_1)

setup_reg_1 = setup_reg.ljust(30)
print(setup_reg_1)

setup_reg_1 = setup_reg.rjust(30)
print(setup_reg_1)

# Старый стиль форматирования все еще поддерживается, и в Python 2, который остановился на версии 2.7, он будет поддерживаться всегда. 
# В Python 3 применяется новый стиль форматирования. 
# Если у вас установлен Python 3.6 или выше, рекомендую воспользоваться f-строками (см. подраздел «Самый новый стиль: f-строки» далее в этой главе).

# Новый стиль форматирования имеет вид строка.format(данные).

# Строка формата выглядит немного иначе, чем в предыдущем подразделе. Простейший пример использования этого стиля показан здесь:

thing_format = 'woodchuck' 
print('{}'.format(thing_format))

# Аргументы функции format() должны идти в том порядке, в котором расставлены заполнители {} в строке формата:

thing_format = 'woodchuck'
place_format = 'lake'
print('The {} is in the {}.'.format(thing_format, place_format))

# В новом стиле форматирования вы также можете указать позицию аргументов следующим образом:

print('The {1} is in the {0}.'.format(place_format, thing_format))

# Значение 0 относится к первому аргументу place, а 1 — к thing.
# Аргументы функции format() могут быть именованными:

print('The {thing_format} is in the {place_format}'.format(thing_format='duck', place_format='bathtub'))

# Они также могут быть словарями:

d_format = {'thing': 'duck', 'place': 'bathtub'}

# В следующем примере {0} — это первый аргумент функции format() (словарь d):

print('The {0[thing]} is in the {0[place]}.'.format(d_format))

# В этих примерах аргументы выводились в формате, установленном по умолчанию. В новом стиле форматирования строка формата несколько отличается от той, которая использовалась в старом стиле. Ее отличия:

# • начальное двоеточие (':');
# • опциональный символ-заполнитель (по умолчанию ''), которым заполняется строка, если ее длина меньше, чем мин_ширина;
# • опциональный символ выравнивания. В этот раз вариантом по умолчанию является выравнивание по левому краю. Символ '<' означает выравнивание по левому краю, символ '>' — по правому, а символ '^' означает выравнивание по центру;
# • опциональный знак для чисел. Отсутствие значения приведет к тому, что знак будет отображаться только для отрицательных чисел. Символ '' означает, что для отрицательных чисел будет добавляться знак -, а для положительных — пробел ('');
# • необязательное поле мин_ширина. Необязательный символ ('.') используется для отделения значений полей мин_ширина и макс_символы;
# • необязательное поле макс_символы;
# • тип преобразования.

thing = 'wraith'
place = 'window'
print('The {} is at the {}'.format(thing, place))
print('The {:10s} is at the {:10s}'.format(thing, place))
print('The {:<10s} is at the {:<10s}'.format(thing, place))
print('The {:^10s} is at the {:^10s}'.format(thing, place))
print('The {:>10s} is at the {:>10s}'.format(thing, place))
print('The {:!^10s} is at the {:!^10s}'.format(thing, place))

# Самый новый стиль: f-строки
# На данный момент для форматирования строк рекомендуется использовать f-строки, которые появились в версии Python 3.6.
# Чтобы создать f-строку, нужно сделать следующее:

# • ввести букву f или F перед первой кавычкой;
# • поместить имена переменной или выражения в фигурные скобки ({}), чтобы их значения попали в строку.

# Этот способ форматирования похож на новый стиль, но здесь не задействованы функция format(), пустые скобки ({}) и позиционные аргументы ({1}) в строке формата.

thing_f = 'wereduck'
place_f = 'werepond'
print(f'The {thing_f} is in the {place_f}')

# Как я уже говорил, в фигурных скобках можно размещать и выражения:

print(f'The {thing_f.capitalize()} is in the {place_f.rjust(20)}')

# Таким образом, то, что вы могли делать внутри функции format() из предыдущего раздела, можно сделать и здесь внутри фигурных скобок в главной строке. Это упрощает чтение.
# Для f-строк используется такой же язык форматирования (ширина, заполнитель, выравнивание), как и в новом стиле. Выражения размещаются после двоеточия:

print(f'The {thing_f:>20} is in the {place_f:.^20}')

# Начиная с версии Python 3.8, f-строки позволяют выводить не только значения переменных, но и их имена. 
# Это очень удобно при отладке. Идея заключается в том, чтобы поставить знак = после имени переменной, размещенного в фигурных скобках:

print(f'{thing_f =}, {place_f =}')

# Этот прием также работает и для выражений. Каждое выражение будет выведено полностью:

print(f'{thing_f[-4:] =}, {place_f.title() =}')

# Наконец, после знака = можно поставить двоеточие, за которым будут следовать аргументы, такие как длины и выравнивания:

print(f'{thing_f = :>4.4}')

# Что еще можно делать со строками
# В Python имеется гораздо больше функций для работы со строками, нежели я сейчас описал. 
# Некоторые из них мы рассмотрим в следующих главах (особенно в главе 12), но описания всех можно найти в стандартной документации (http://bit.ly/py-docs-strings).

# Exercisec
# 5.1 (Напиши с заглвной буквы слово начинающееся на m)

song = """When an eel grabs your arm, And it causes great harm, That's - a moray!"""
print(song.replace(' m',' M'))

# or

print(song.replace('moray','Moray'))
