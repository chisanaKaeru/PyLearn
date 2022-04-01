// ignore_for_file: file_names, dead_code

import 'package:flutter/material.dart';

import '../../Utils/realTimeDatabase.dart';
import '../../Utils/testWidget.dart';
import 'TestTwoFive.dart';

class TestTwoFour extends StatefulWidget {
  const TestTwoFour({Key? key}) : super(key: key);

  @override
  _TestTwoFourState createState() => _TestTwoFourState();
}

class _TestTwoFourState extends State<TestTwoFour> {
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
        isColor2 == true &&
        isColor3 == true &&
        isColor4 == true) {
      setchart(1.42, 1.42, 1.42, 1.42, 1.42, 1.42, 1.42);
      showModalBottomSheet(
          context: context,
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.green,
          builder: (BuildContext context) {
            return bottomSheetGreen(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TestTwoFive())),
            );
          });
    } else {
      setchart(0.326, 0.326, 0.326, 0.326, 0.326, 0.326, 0.326);
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
              text: 'Чему будет равно выражение a*=5, если a было равно 6?',
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  buttonTestWidget(
                    color: isColor1 ? Colors.white : Colors.green,
                    text: '30',
                    onPressed: firstCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor2 ? Colors.white : Colors.green,
                    text: '5',
                    onPressed: secondCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor3 ? Colors.white : Colors.green,
                    text: '6',
                    onPressed: thirdCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor4 ? Colors.white : Colors.green,
                    onPressed: fourthCheck,
                    text: '11',
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
