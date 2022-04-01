// ignore_for_file: camel_case_types, import_of_legacy_library_into_null_safe, file_names

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pylearn/Utils/realTimeDatabase.dart';

import 'mainSections/mainSectionOne.dart';

class mainMenuTheme extends StatefulWidget {
  const mainMenuTheme({Key? key}) : super(key: key);

  @override
  _mainMenuThemeState createState() => _mainMenuThemeState();
}

class _mainMenuThemeState extends State<mainMenuTheme> {
  @override
  void initState() {
    setState(() {
      Database().showData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 25.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const SizedBox(height: 25),
              LinearButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainSelectionOne()))
                    .then((value) {
                  setState(() {});
                }),
                precent: topicCategory / 100,
                text: 'Основы языка Python',
              ),
              LinearButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainSelectionOne()))
                    .then((value) {
                  setState(() {});
                }),
                precent: 0 / 100,
                text: 'Условия и циклы',
              ),
              LinearButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainSelectionOne()))
                    .then((value) {
                  setState(() {});
                }),
                precent: 0 / 100,
                text: 'Строки и символы',
              ),
              LinearButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainSelectionOne()))
                    .then((value) {
                  setState(() {});
                }),
                precent: 0 / 100,
                text: 'Структурированные типы данных',
              ),
              LinearButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainSelectionOne()))
                    .then((value) {
                  setState(() {});
                }),
                precent: 0 / 100,
                text: 'Функции, модули, подключение библиотек',
              ),
              LinearButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainSelectionOne()))
                    .then((value) {
                  setState(() {});
                }),
                precent: 0 / 100,
                text: 'Работа с файлами и картинками',
              ),
              LinearButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainSelectionOne()))
                    .then((value) {
                  setState(() {});
                }),
                precent: 0 / 100,
                text: 'Работа с Интернетом',
              ),
              LinearButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainSelectionOne()))
                    .then((value) {
                  setState(() {});
                }),
                precent: 0 / 100,
                text: 'ООП',
              ),
              LinearButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainSelectionOne()))
                    .then((value) {
                  setState(() {});
                }),
                precent: 0 / 100,
                text: 'Популярные библиотеки',
              ),
              LinearButton(
                onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainSelectionOne()))
                    .then((value) {
                  setState(() {});
                }),
                precent: 0 / 100,
                text: 'Библиотека NumPy',
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class LinearButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;
  final double precent;

  const LinearButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.precent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        width: 375,
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 15.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: 350,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2500,
              percent: precent,
              backgroundColor: Theme.of(context).backgroundColor,
              barRadius: const Radius.circular(100),
              progressColor: Colors.yellowAccent,
            ),
          ],
        ),
      ),
    );
  }
}
