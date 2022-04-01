// ignore_for_file: unnecessary_import, file_names, prefer_typing_uninitialized_variables, must_be_immutable, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../Utils/realTimeDatabase.dart';
import '../../Utils/subjectText.dart';
import '../../Utils/testWidget.dart';
import 'TestTwoOne.dart';

class ThemeTwoScreenOne extends StatefulWidget {
  const ThemeTwoScreenOne({Key? key}) : super(key: key);

  @override
  _ThemeTwoScreenOneState createState() => _ThemeTwoScreenOneState();
}

class _ThemeTwoScreenOneState extends State<ThemeTwoScreenOne> {
  void _jumpTestOne() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const TestTwoOne()));

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
              'Арифметические операторы',
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
                      'https://www.youtube.com/watch?v=g-4JbaY-yWU&ab_channel=WebDeveloperBlog',
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
                        const captionText(
                            text:
                                'Python поддерживает все распространенные арифметические операции:',
                            fontSize: 20),
                        const plainText(text: '\n+     Сложение двух чисел:'),
                        const codeText(text: 'print(6 + 2)  # 8'),
                        const plainText(text: '\n-   Вычитание двух чисел:'),
                        const codeText(text: 'print(6 - 2)  # 4'),
                        const plainText(text: '\n/     Деление двух чисел:'),
                        const codeText(text: 'print(6 / 2)  # 3.0'),
                        const plainText(
                            text: '\n//     Целочисленное деление двух чисел:'),
                        const codeText(
                          text: ('print(7 / 2)  # 3.5\nprint(7 // 2)  # 3'),
                        ),
                        const plainText(
                            text:
                                'Данная операция возвращает целочисленный результат деления, отбрасывая дробную часть'),
                        const plainText(text: '\n**     Возведение в степень:'),
                        const codeText(
                            text:
                                'print(6 ** 2)  # Возводим число 6 в степень 2. Результат - 36'),
                        const plainText(
                            text: '\n%     Получение остатка от деления:'),
                        const codeText(
                            text:
                                'print(7 % 2)  # Получение остатка от деления числа 7 на 2. Результат - 1'),
                        const plainText(
                            text:
                                'В данном случае ближайшее число к 7, которое делится на 2 без остатка, это 6. Поэтому остаток от деления равен 7 - 6 = 1'),
                        const plainText(
                            text:
                                '\nПри последовательном использовании нескольких арифметических операций их выполнение производится в соответствии с их приоритетом. В начале выполняются операции с большим приоритетом. Приоритеты операций в порядке убывания приведены в следующей таблице.'),
                        Table(
                          children: [
                            TableRow(children: [
                              Column(
                                children: const [
                                  Text('Операции\n**\n* / // %\n+ -')
                                ],
                              ),
                              Column(
                                children: const [
                                  Text(
                                      'Направление\nСправо налево\nСлева направо\nСлева направо')
                                ],
                              ),
                            ]),
                          ],
                        ),
                        const plainText(
                            text:
                                '\nПусть у нас выполняется следующее выражение:'),
                        const codeText(
                            text:
                                'number = 3 + 4 * 5 ** 2 + 7\nprint(number)  # 110'),
                        const captionText(text: '\nЦелые числа', fontSize: 16),
                        const plainText(
                            text:
                                'Здесь начале выполняется возведение в степень (5 ** 2) как операция с большим приоритетом, далее результат умножается на 4 (25 * 4), затем происходит сложение (3 + 100) и далее опять идет сложение (103 + 7).'),
                        const plainText(
                            text:
                                '\nЧтобы переопределить порядок операций, можно использовать скобки:'),
                        const codeText(
                            text:
                                'number = (3 + 4) * (5 ** 2 + 7)\nprint(number)  # 224'),
                        const plainText(
                            text:
                                '\nСледует отметить, что в арифметических операциях могут принимать участие как целые, так и дробные числа. Если в одной операции участвует целое число (int) и число с плавающей точкой (float), то целое число приводится к типу float.'),
                        const captionText(
                            text: '\nАрифметические операции с присвоением',
                            fontSize: 16),
                        const plainText(
                            text:
                                'Ряд специальных операций позволяют использовать присвоить результат операции первому операнду:\n+=   Присвоение результата сложения\n-=   Присвоение результата вычитания\n*=   Присвоение результата умножения\n/=   Присвоение результата от деления\n//=   Присвоение результата целочисленного деления\n**=   Присвоение степени числа\n%=   Присвоение остатка от деления'),
                        const plainText(text: 'Примеры операций:'),
                        const codeText(
                            text:
                                'number = 10\nnumber += 5\nprint(number)  # 15\n \nnumber -= 3\nprint(number)  # 12\n \nnumber *= 4\nprint(number)  # 48'),
                        buttonNavigationTest(
                          onPressed: () {
                            _jumpTestOne();
                            Database().setData(
                                FirebaseAuth.instance.currentUser!.uid
                                    .toString(),
                                31,
                                topicOne.toDouble(),
                                15,
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
