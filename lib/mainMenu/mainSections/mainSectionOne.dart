// ignore_for_file: camel_case_types, import_of_legacy_library_into_null_safe, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pylearn/Utils/realTimeDatabase.dart';
import '../../LessonTopics/ThemeOne/ThemeOne.dart';
import '../../LessonTopics/ThemeTwo/ThemeTwo.dart';
import '../../Utils/ButtonsTheme.dart';
import '../../Utils/testWidget.dart';

class mainSelectionOne extends StatefulWidget {
  const mainSelectionOne({Key? key}) : super(key: key);

  @override
  _mainSelectionOneState createState() => _mainSelectionOneState();
}

class _mainSelectionOneState extends State<mainSelectionOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Основы языка Python',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText2?.color,
            ),
          ),
          centerTitle: true,
          leading: const iconPopButton()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 10.0,
            runSpacing: 40.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: CircleButton(
                  onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThemeOneScreenOne()))
                      .then((value) => {setState(() {})}),
                  iconData: CupertinoIcons.doc_text,
                  text: 'Типы данных\nи переменные',
                  precent: topicOne / 100,
                ),
              ),
              CircleButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThemeTwoScreenOne()))
                    .then((value) => {setState(() {})}),
                iconData: CupertinoIcons.divide,
                text: 'Арифметические\nоператоры',
                precent: topicTwo / 100,
              ),
              CircleButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThemeOneScreenOne()))
                    .then((value) => {setState(() {})}),
                iconData: CupertinoIcons.function,
                text: 'Математические\nфункции ',
                precent: 0 / 100,
              ),
              CircleButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThemeOneScreenOne()))
                    .then((value) => {setState(() {})}),
                iconData: CupertinoIcons.equal,
                text: 'Операции\nсравнения',
                precent: 0 / 100,
              ),
              CircleButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThemeOneScreenOne()))
                    .then((value) => {setState(() {})}),
                iconData: CupertinoIcons.exclamationmark,
                text: 'Логические\nоперации',
                precent: 0 / 100,
              ),
              CircleButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThemeOneScreenOne()))
                    .then((value) => {setState(() {})}),
                iconData: CupertinoIcons.keyboard,
                text: 'Ввод\nданных',
                precent: 0 / 100,
              ),
              CircleButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThemeOneScreenOne()))
                    .then((value) => {setState(() {})}),
                iconData: CupertinoIcons.greaterthan_square,
                text: 'Вывод\nданных',
                precent: 0 / 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
