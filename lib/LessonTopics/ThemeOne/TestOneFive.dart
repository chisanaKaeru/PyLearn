// ignore_for_file: file_names, dead_code

import 'package:flutter/material.dart';
import 'package:pylearn/mainMenu/mainSections/mainSectionOne.dart';

import '../../Utils/realTimeDatabase.dart';
import '../../Utils/testWidget.dart';

class TestFive extends StatefulWidget {
  const TestFive({Key? key}) : super(key: key);

  @override
  _TestFiveState createState() => _TestFiveState();
}

class _TestFiveState extends State<TestFive> {
  bool isColor1 = true;
  bool isColor2 = true;

  void firstCheck() {
    isColor1 = !isColor1;

    setState(() {});
  }

  void secondCheck() {
    isColor2 = !isColor2;
    setState(() {});
  }

  void examination() {
    if (isColor1 == true && isColor2 == false) {
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
              text: 'Python является языком с/со…',
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  buttonTestWidget(
                    color: isColor1 ? Colors.white : Colors.green,
                    text: 'Строгой типизацией',
                    onPressed: firstCheck,
                  ),
                  const SizedBox(height: 15),
                  buttonTestWidget(
                    color: isColor2 ? Colors.white : Colors.green,
                    text: 'Динамической типизацией',
                    onPressed: secondCheck,
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
