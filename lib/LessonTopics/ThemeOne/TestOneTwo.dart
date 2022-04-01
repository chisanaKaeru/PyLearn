// ignore_for_file: file_names, dead_code

import 'package:flutter/material.dart';
import 'package:pylearn/LessonTopics/ThemeOne/TestOneThree.dart';
import '../../Utils/realTimeDatabase.dart';
import '../../Utils/testWidget.dart';

class TestTwo extends StatefulWidget {
  const TestTwo({Key? key}) : super(key: key);

  @override
  _TestTwoState createState() => _TestTwoState();
}

class _TestTwoState extends State<TestTwo> {
  bool isColor1 = true;
  bool isColor2 = true;
  bool isColor3 = true;
  bool isColor4 = true;
  void firstCheck() {
    isColor1 = !isColor1;

    setState(() {});
  }

  void secondCheck() {
    isColor2 = !isColor2;
    setState(() {});
  }

  void thirdCheck() {
    isColor3 = !isColor3;
    setState(() {});
  }

  void fourthCheck() {
    isColor4 = !isColor4;
    setState(() {});
  }

  void examination() {
    if (isColor1 == false &&
        isColor3 == true &&
        isColor2 == true &&
        isColor4 == true) {
      setchart(1.25, 1.25, 1.25, 1.25, 1.25, 1.25, 1.25);
      showModalBottomSheet(
          context: context,
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.green,
          builder: (BuildContext context) {
            return bottomSheetGreen(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TestThree())),
            );
          });
    } else {
      setchart(0.76, 0.76, 0.76, 0.76, 0.76, 0.76, 0.76);
      showModalBottomSheet(
          context: context,
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.red,
          builder: (BuildContext context) {
            return bottomSheetRed(onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            });
          });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Column(
          children: [
            const textTestQuestion(
              text: 'Какой тип называют логическим?',
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  buttonTestWidget(
                    color: isColor1 ? Colors.white : Colors.green,
                    text: 'Bool',
                    onPressed: firstCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor2 ? Colors.white : Colors.green,
                    text: 'Int',
                    onPressed: secondCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor3 ? Colors.white : Colors.green,
                    text: 'Char',
                    onPressed: thirdCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor4 ? Colors.white : Colors.green,
                    onPressed: fourthCheck,
                    text: 'Str',
                  ),
                ],
              ),
            ),
            buttonNextTest(onPressed: examination),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
