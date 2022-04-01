// ignore_for_file: file_names, dead_code

import 'package:flutter/material.dart';

import '../../Utils/realTimeDatabase.dart';
import '../../Utils/testWidget.dart';
import 'TestTwoTwo.dart';

class TestTwoOne extends StatefulWidget {
  const TestTwoOne({Key? key}) : super(key: key);

  @override
  _TestTwoOneState createState() => _TestTwoOneState();
}

class _TestTwoOneState extends State<TestTwoOne> {
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
    if (isColor1 == true &&
        isColor2 == true &&
        isColor3 == false &&
        isColor4 == true) {
      setchart(1.1, 1.1, 1.1, 1.1, 1.1, 1.1, 1.1);
      showModalBottomSheet(
          context: context,
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.green,
          builder: (BuildContext context) {
            return bottomSheetGreen(onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TestTwoTwo()));
            });
          });
    } else {
      setchart(0.95, 0.95, 0.95, 0.95, 0.95, 0.95, 0.95);
      showModalBottomSheet(
          context: context,
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.red,
          builder: (BuildContext context) {
            return bottomSheetRed(onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            });
          });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const textTestQuestion(
            text:
                'Какой из операторов используется для возведения числа в степень?',
          ),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 20),
                buttonTestWidget(
                  color: isColor1 ? Colors.white : Colors.green,
                  text: '*',
                  onPressed: firstCheck,
                ),
                const SizedBox(height: 15),
                buttonTestWidget(
                  color: isColor2 ? Colors.white : Colors.green,
                  text: '^',
                  onPressed: secondCheck,
                ),
                const SizedBox(height: 15),
                buttonTestWidget(
                  color: isColor3 ? Colors.white : Colors.green,
                  text: '**',
                  onPressed: thirdCheck,
                ),
                const SizedBox(height: 15),
                buttonTestWidget(
                  color: isColor4 ? Colors.white : Colors.green,
                  onPressed: fourthCheck,
                  text: '%',
                ),
              ],
            ),
          ),
          buttonNextTest(onPressed: examination),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
