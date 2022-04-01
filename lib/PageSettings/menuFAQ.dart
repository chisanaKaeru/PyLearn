// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../Utils/testWidget.dart';

class main_FAQ extends StatefulWidget {
  main_FAQ({Key? key}) : super(key: key);

  @override
  State<main_FAQ> createState() => _main_FAQState();
}

class _main_FAQState extends State<main_FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'FAQ',
          style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color),
        ),
        leading: const iconPopButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
        child: Column(
          children: [
            ExpansionTile(
              title: const Text('Что делать если пропал прогерсс?'),
              collapsedTextColor: Colors.white,
              textColor: Colors.white,
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              children: [
                ListTile(
                    title: Text(
                  'Не паниковать и сообщить разработчику о данной проблеме, если вы будете паниковать то разработчик не сможет вас понять',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2!.color),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
