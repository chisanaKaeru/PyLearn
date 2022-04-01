// ignore_for_file: file_names, dead_code

import 'package:flutter/material.dart';

import '../../Utils/realTimeDatabase.dart';
import '../../Utils/testWidget.dart';

class TestTwoFive extends StatefulWidget {
  const TestTwoFive({Key? key}) : super(key: key);

  @override
  _TestTwoFiveState createState() => _TestTwoFiveState();
}

class _TestTwoFiveState extends State<TestTwoFive> {
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
        isColor3 == true &&
        isColor4 == false) {
      setchart(1.867, 1.867, 1.867, 1.867, 1.867, 1.867, 1.867);
      showModalBottomSheet(
          context: context,
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.green,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () => Future.value(false),
              child: Container(
                color: Colors.green,
                height: 150,
                child: Column(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text('Правильно',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 65,
                          width: 185,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.green.shade400)),
                              onPressed: () => Navigator.of(context)
                                  .popUntil((route) => route.isFirst),
                              child: const Text('На главную',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14))),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 65,
                          width: 185,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.green.shade400)),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text('К темам',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14))),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          });
    } else {
      setchart(0.133, 0.133, 0.133, 0.133, 0.133, 0.133, 0.133);
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
              text: 'Чему будет равно выражени\nc=(a+4)*b**2, если a=1, b=3?',
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
                    text: '37',
                    onPressed: secondCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor3 ? Colors.white : Colors.green,
                    text: '225',
                    onPressed: thirdCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor4 ? Colors.white : Colors.green,
                    text: '45',
                    onPressed: fourthCheck,
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
