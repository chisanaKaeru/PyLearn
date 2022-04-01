// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class plainText extends StatelessWidget {
  final String text;

  const plainText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      ),
    );
  }
}

class captionText extends StatelessWidget {
  final String text;
  final double fontSize;

  const captionText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class codeText extends StatelessWidget {
  final String text;

  const codeText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SyntaxView(
        code: text,
        syntax: Syntax.YAML,
        syntaxTheme: SyntaxTheme.ayuDark(),
        fontSize: 14.0,
        withZoom: false,
      ),
    );
  }
}

class consoleText extends StatelessWidget {
  final String text;

  const consoleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Container(
            width: 200,
            height: 75,
            color: Colors.black,
          ),
          Positioned(
            top: 5,
            left: 10,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Python console output:\n$text')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
