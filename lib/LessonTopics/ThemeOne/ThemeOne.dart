// ignore_for_file: unnecessary_import, file_names, prefer_typing_uninitialized_variables, must_be_immutable, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../Utils/realTimeDatabase.dart';
import '../../Utils/subjectText.dart';
import '../../Utils/testWidget.dart';
import 'TestOneOne.dart';

class ThemeOneScreenOne extends StatefulWidget {
  const ThemeOneScreenOne({Key? key}) : super(key: key);

  @override
  _ThemeOneScreenOneState createState() => _ThemeOneScreenOneState();
}

class _ThemeOneScreenOneState extends State<ThemeOneScreenOne> {
  void _jumpTestOne() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const TestOne()));

    setState(() {});
  }

  static const double _appBarBottomBtnPosition = -10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            centerTitle: true,
            title: Text(
              'Типы данных и переменные',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
            leading: const iconPopButton(),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Transform.translate(
                offset: const Offset(0, _appBarBottomBtnPosition),
                child: const buttonMaterialVideo(
                  text:
                      'https://www.youtube.com/watch?v=bpASbXwjSp4&ab_channel=WebDeveloperBlog',
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const captionText(text: 'Переменные', fontSize: 20),
                        const plainText(
                          text:
                              'Переменные предназначены для хранения данных. Название переменной в Python должно начинаться с алфавитного символа или со знака подчеркивания и может содержать алфавитно-цифровые символы и знак подчеркивания. И кроме того, название переменной не должно совпадать с названием ключевых слов языка Python. Ключевых слов не так много, их легко запомнить:\n1 False   await   else   import   pass\n2 None   break   except   in   raise\n3 True   class   finally   is   return\n4 and   continue   for   lambda   try\n5 as   def   from   nonlocal   while\n6 assert   del   global   not   with\n7 async   elif   if   or   yield\nНапример, создадим переменную:',
                        ),
                        const codeText(text: 'userId = "abc"'),
                        const plainText(
                            text:
                                'Здесь определена переменная name, которая хранит строку "Tom".\nВ пайтоне применяется два типа наименования переменных: camel case и underscore notation.\nCamel case подразумевает, что каждое новое подслово в наименовании переменной начинается с большой буквы. Например:'),
                        const codeText(text: 'userName = "Tom"'),
                        const plainText(
                            text:
                                'Underscore notation подразумевает, что подслова в наименовании переменной разделяются знаком подчеркивания. Например:'),
                        const codeText(text: 'user_name = "Tom"'),
                        const plainText(
                            text:
                                'И также надо учитывать регистрозависимость, поэтому переменные name и Name будут представлять разные объекты.'),
                        const codeText(
                            text:
                                '# две разные переменные\nname = "Tom"\nName = "Tom"'),
                        const plainText(
                            text:
                                'Определив переменную, мы можем использовать в программе. Например, попытаться вывести ее содержимое на консоль с помощью встроенной функции print:'),
                        const codeText(
                            text:
                                'name = "Tom" # определение переменной name\nprint(name) # вывод значения переменной name на консоль'),
                        const plainText(
                            text:
                                'Например, определение и применение переменной в среде PyCharm:\nОтличительной особенностью переменной является то, что мы можем менять ее значение в течение работы программы:'),
                        const codeText(
                            text:
                                'name = "Tom" # переменной name равна "Tom"\nprint(name) # выводит: Tom\nname = "Bob" # меняем значение на "Bob"\nprint(name) # выводит: Bob'),
                        const captionText(text: '\nТипы данных', fontSize: 20),
                        const plainText(
                            text:
                                'Переменная хранит данные одного из типов данных. В Python существует множество различных типов данных. В данном случае рассмотрим только самые базовые типы: bool, int, float, complex и str.\n'),
                        const captionText(
                            text: 'Логические значения', fontSize: 16),
                        const plainText(
                            text:
                                'Тип bool представляет два логических значения: True (верно, истина) или False (неверно, ложь). Значение True слудит для того, чтобы показать, что что-то истинно. Тогда как значение False, наоборот, показывает, что что-то ложно. Пример переменных данного типа:'),
                        const codeText(
                            text:
                                'isMarried = False\nprint(isMarried) # False\nisAlive = True\nprint(isAlive) # True'),
                        const captionText(text: '\nЦелые числа', fontSize: 16),
                        const plainText(
                            text:
                                'Тип int представляет целое число, например, 1, 4, 8, 50. Пример:'),
                        const codeText(
                            text:
                                'age = 21\nprint("Возраст:", age) # Возраст: 21\ncount = 15\nprint("Количество:", count) # Количество: 15'),
                        const plainText(
                            text:
                                'По умолчанию стандартные числа расцениваются как числа в десятичной системе. Но Python также поддерживает числа в двоичной, восьмеричной и шестнадцатеричной системах.\nДля указания, что число представляет двоичную систему, перед числом ставится префикс 0b:'),
                        const codeText(
                            text:
                                'a = 0b11\nb = 0b1011\nc = 0b100001\nprint(a) # 3 в десятичной системе\nprint(b) # 11 в десятичной системе\nprint(c) # 33 в десятичной системе'),
                        const plainText(
                            text:
                                'Для указания, что число представляет восьмеричную систему, перед числом ставится префикс 0o:'),
                        const codeText(
                            text:
                                'a = 0o7\nb = 0o11\nc = 0o17\nprint(a) # 7 в десятичной системе\nprint(b) # 9 в десятичной системе\nprint(c) # 15 в десятичной системе'),
                        const plainText(
                            text:
                                'Для указания, что число представляет шестнадцатеричную систему, перед числом ставится префикс 0x:'),
                        const codeText(
                            text:
                                'a = 0x0A\nb = 0xFF\nc = 0xA1\nprint(a) # 10 в десятичной системе\nprint(b) # 255 в десятичной системе\nprint(c) # 161 в десятичной системе'),
                        const plainText(
                            text:
                                'Стоит отметить, что в какой-бы системе мы не передали число в функцию print для вывода на консоль, оно по умолчанию будет выводиться в десятичной системе.\n'),
                        const captionText(text: 'Дробные числа', fontSize: 16),
                        const plainText(
                            text:
                                'Тип float представляет число с плавающей точкой, например, 1.2 или 34.76. В качесте разделителя целой и дробной частей используется точка.'),
                        const codeText(
                            text:
                                'height = 1.68\npi = 3.14\nweight = 68.\nprint(height) # 1.68\nprint(pi) # 3.14\nprint(weight) # 68.0'),
                        const plainText(
                            text:
                                'Число с плавающей точкой можно определять в экспоненциальной записи:'),
                        const codeText(
                            text:
                                'x = 3.9e3\nprint(x) # 3900.0\nx = 3.9e-3\nprint(x) # 0.0039'),
                        const plainText(
                            text:
                                'Число float может иметь только 18 значимых символов. Так, в данном случае используются только два символа - 3.9. И если число слишком велико или слишком мало, то мы можем записывать число в подобной нотации, используя экспоненту. Число после экспоненты указывает степень числа 10, на которое надо умножить основное число - 3.9.\n'),
                        const captionText(
                            text: 'Комплексные числа', fontSize: 16),
                        const plainText(
                            text:
                                'Тип complex представляет комплексные числа в формате вещественная_часть+мнимая_частьj - после мнимой части указывается суффикс j'),
                        const codeText(
                            text:
                                'complexNumber = 1+2j\nprint(complexNumber) # (1+2j)'),
                        const captionText(text: '\nСтроки', fontSize: 16),
                        const plainText(
                            text:
                                '''Тип str представляет строки. Строка представляет последовательность символов, заключенную в одинарные или двойные кавычки, например "hello" и 'hello'. В Python 3.x строки представляют набор символов в кодировке Unicode'''),
                        const codeText(
                            text:
                                '''complexNumber = 1+2j\nmessage = "Hello World!"\nprint(message) # Hello World!\nname = 'Tom'\nprint(name) # Tom'''),
                        const plainText(
                            text:
                                'При этом если строка имеет много символов, ее можем разбить ее на части и разместить их на разных строках кода. В этом случае вся строка заключается в круглые скобки, а ее отдельные части - в кавычки:'),
                        const codeText(
                            text:
                                'text = ("Laudate omnes gentes laudate " "Magnificat in secula ")\nprint(text)'),
                        const plainText(
                            text:
                                'Если же мы хотим определить многострочный текст, то такой текст заключается в тройные двойные или одинарные кавычки:'),
                        const codeText(
                            text:
                                """'''\nЭто комментарий\n'''\ntext = '''Laudate omnes gentes laudate\nMagnificat in secula\nEt anima mea laudate\nMagnificat in secula\n'''\nprint(text) """),
                        const plainText(
                            text:
                                'При использовани тройных одинарных кавычек не стоит путать их с комментариями: если текст в тройных одинарных кавычках присваивается переменной, то это строка, а не комментарий.\n'),
                        const captionText(
                            text: 'Управляющие последовательности в строке',
                            fontSize: 16),
                        const plainText(
                            text:
                                '''Строка может содержать ряд специальных символов - управляющих последовательностей. Некоторые из них:\n\\: позволяет добавить внутрь строки слеш\n\\': позволяет добавить внутрь строки одинарную кавычку\n\\": позволяет добавить внутрь строки двойную кавычку\n\\n: осуществляет переход на новую строку\n\\t: добавляет табуляцию (4 отступа)\nПрименим несколько последовательностей:'''),
                        const codeText(
                            text:
                                'text = "Message:\\n\\"Hello World\\""\nprint(text)'),
                        const plainText(text: 'Консольный вывод программы:'),
                        const consoleText(text: 'Message:\n"Hello World"'),
                        const plainText(
                            text:
                                'Хотя подобные последовательности могут нам помочь в некоторых делах, например, поместить в строку кавычку, сделать табуляцию, перенос на другую строку. Но они также могут и мешать. Например:'),
                        const codeText(
                            text: 'path = "C:\\python\\name.txt"\nprint(path)'),
                        const plainText(
                            text:
                                'Здесь переменная path содержит некоторый путь к файлу. Однако внутри строки встречаются символы "\n", которые будут интерпретированы как управляющая последовательность. Так, мы получим следующий консольный вывод:'),
                        const consoleText(text: 'C:\\python\name.txt'),
                        const plainText(
                            text:
                                'Чтобы избежать подобной ситуации, перед строкой ставится символ r'),
                        const codeText(
                            text:
                                'path = r"C:\\python\\name.txt"\nprint(path)'),
                        const captionText(
                            text: '\nВставка значений в строку', fontSize: 16),
                        const plainText(
                            text:
                                'Python позволяет встравивать в строку значения других переменных. Для этого внутри строки переменные размещаются в фигурных скобках {}, а перед всей строкой ставится символ f:'),
                        const codeText(
                            text:
                                'userName = "Tom"\nuserAge = 37\nuser = f"name: {userName} age: {userAge}"\nprint(user) # name: Tom age: 37'),
                        const plainText(
                            text:
                                'В данном случае на место {userName} будет вставляться значение переменной userName. Аналогично на вместо {userAge} будет вставляться значение переменной userAge.\n'),
                        const captionText(
                            text: 'Динамическая типизация', fontSize: 16),
                        const plainText(
                            text:
                                'Python является языком с динамической типизацией. А это значит, что переменная не привязана жестко с определенному типу.\nТип переменной определяется исходя из значения, которое ей присвоено. Так, при присвоении строки в двойных или одинарных кавычках переменная имеет тип str. При присвоении целого числа Python автоматически определяет тип переменной как int. Чтобы определить переменную как объект float, ей присваивается дробное число, в котором разделителем целой и дробной части является точка.\nПри этом в процессе работы программы мы можем изменить тип переменной, присвоив ей значение другого типа:'),
                        const codeText(
                            text:
                                'userId = "abc" # тип str\nprint(userId)\nuserId = 234 # тип int\nprint(userId)'),
                        const plainText(
                            text:
                                'С помощью встроенной функции type() динамически можно узнать текущий тип переменной:'),
                        const codeText(
                            text:
                                '''userId = "abc" # тип str\nprint(type(userId)) # <class 'str'>\nuserId = 234 # тип int\nprint(type(userId)) # <class 'int'>'''),
                        buttonNavigationTest(
                          onPressed: () {
                            _jumpTestOne();
                            Database().setData(
                                FirebaseAuth.instance.currentUser!.uid
                                    .toString(),
                                16,
                                15,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0);
                          },
                        ),
                      ],
                    ),
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
