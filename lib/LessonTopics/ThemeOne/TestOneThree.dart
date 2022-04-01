// ignore_for_file: file_names, dead_code

import 'package:flutter/material.dart';
import 'package:pylearn/LessonTopics/ThemeOne/TestOneFour.dart';

import '../../Utils/realTimeDatabase.dart';
import '../../Utils/testWidget.dart';

class TestThree extends StatefulWidget {
  const TestThree({Key? key}) : super(key: key);

  @override
  _TestThreeState createState() => _TestThreeState();
}

class _TestThreeState extends State<TestThree> {
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
      setchart(1.3, 1.3, 1.3, 1.3, 1.3, 1.3, 1.3);
      showModalBottomSheet(
          context: context,
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.green,
          builder: (BuildContext context) {
            return bottomSheetGreen(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TestFour())),
            );
          });
    } else {
      setchart(0.612, 0.612, 0.612, 0.612, 0.612, 0.612, 0.612);
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
              text: 'Сколько значимых символов может\nиметь число типа Float?',
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  buttonTestWidget(
                    color: isColor1 ? Colors.white : Colors.green,
                    text: '18',
                    onPressed: firstCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor2 ? Colors.white : Colors.green,
                    text: '10',
                    onPressed: secondCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor3 ? Colors.white : Colors.green,
                    text: '20',
                    onPressed: thirdCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor4 ? Colors.white : Colors.green,
                    onPressed: fourthCheck,
                    text: '6',
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
