// ignore_for_file: camel_case_types, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class iconPopButton extends StatelessWidget {
  const iconPopButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 25,
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        CupertinoIcons.chevron_back,
        color: Theme.of(context).textTheme.bodyText2?.color,
      ),
    );
  }
}

class textTestQuestion extends StatelessWidget {
  final String text;
  const textTestQuestion({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class buttonNextTest extends StatelessWidget {
  final VoidCallback onPressed;
  const buttonNextTest({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 350,
          height: 55,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              'Проверить',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class buttonMaterialVideo extends StatelessWidget {
  final String text;
  const buttonMaterialVideo({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: const Color(0xFF7945BD),
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
              builder: (BuildContext context) {
                return YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId:
                        YoutubePlayer.convertUrlToId(text).toString(),
                    flags: const YoutubePlayerFlags(
                      enableCaption: false,
                      controlsVisibleAtStart: true,
                      autoPlay: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.red,
                  ),
                );
              });
        },
        child: Text(
          'Видеоматериал',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).textTheme.bodyText2?.color,
          ),
        ),
      ),
    );
  }
}

class buttonNavigationTest extends StatelessWidget {
  final VoidCallback onPressed;
  const buttonNavigationTest({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        SizedBox(
          width: 250,
          height: 50,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              'Перейти к тестам',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 25)
      ],
    );
  }
}

class bottomSheetRed extends StatelessWidget {
  final VoidCallback onPressed;
  const bottomSheetRed({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Container(
        color: Colors.red,
        height: 150,
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text('Не правильно',
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent)),
                      onPressed: () => Navigator.of(context)
                          .popUntil((route) => route.isFirst),
                      child: const Text('На главную',
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 65,
                  width: 185,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent)),
                      onPressed: onPressed,
                      child: const Text('Повторить материал',
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class bottomSheetGreen extends StatelessWidget {
  final VoidCallback onPressed;
  const bottomSheetGreen({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green.shade400)),
                      onPressed: () => Navigator.of(context)
                          .popUntil((route) => route.isFirst),
                      child: const Text('На главную',
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 65,
                  width: 185,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green.shade400)),
                      onPressed: onPressed,
                      child: const Text('Дальше',
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class buttonTestWidget extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const buttonTestWidget({
    Key? key,
    required this.color,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 55,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(
                width: 3,
                color: color,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
