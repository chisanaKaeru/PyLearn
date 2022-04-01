// ignore_for_file: file_names, unnecessary_import, camel_case_types, duplicate_import, unused_import, override_on_non_overriding_member, prefer_const_declarations, unused_local_variable, deprecated_member_use, prefer_const_constructors, avoid_print, non_constant_identifier_names, unused_element, prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:provider/provider.dart';
import 'package:pylearn/PageSettings/menuAbout.dart';
import 'package:pylearn/mainMenu/mainMenu.dart';
import 'package:pylearn/mainMenu/mainMenuTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:pylearn/Utils/themes.dart';
import 'package:pylearn/main.dart';
import 'package:pylearn/signInAndSignUp/resetPassword.dart';

import '../PageSettings/menuFAQ.dart';
import '../Utils/realTimeDatabase.dart';

class mainMenuSettings extends StatefulWidget {
  const mainMenuSettings({Key? key}) : super(key: key);

  @override
  _mainMenuSettingsState createState() => _mainMenuSettingsState();
}

class _mainMenuSettingsState extends State<mainMenuSettings> {
  void _resetPassword() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const FormResetPasswordWidget()));
    setState(() {});
  }

  void _mainFAQ() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => main_FAQ()));
    setState(() {});
  }

  launchEmail() async {
    launch('mailto:pasha260777@gmail.com?subject=&body=');
  }

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 25,
          runSpacing: 15,
          children: [
            SettingWidget(
              text: 'О приложении',
              icon: Icon(CupertinoIcons.device_phone_portrait,
                  color: Theme.of(context).textTheme.bodyText2?.color,
                  size: 30),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const aboutMain())),
            ),
            SettingWidget(
              text: 'Сбросить пароль',
              icon: Icon(CupertinoIcons.lock_circle,
                  color: Theme.of(context).textTheme.bodyText2?.color,
                  size: 30),
              onTap: _resetPassword,
            ),
            SettingWidget(
              text: 'Выбор темы',
              icon: Icon(
                CupertinoIcons.today,
                color: Theme.of(context).textTheme.bodyText2?.color,
                size: 30,
              ),
              onTap: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        title: Row(children: [
                          Text(
                            'Выберите тему',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.color),
                          ),
                          Icon(
                            CupertinoIcons.today,
                            color: Theme.of(context).textTheme.bodyText2?.color,
                            size: 30,
                          ),
                        ]),
                        content: selectTheme(),
                      )),
            ),
            SettingWidget(
              text: 'Сбросить обучение',
              icon: Icon(
                CupertinoIcons.arrow_counterclockwise_circle,
                color: Theme.of(context).textTheme.bodyText2?.color,
                size: 30,
              ),
              onTap: () => showDialog(
                  context: context,
                  useRootNavigator: false,
                  builder: (_) => AlertDialog(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Database().setData(
                                  FirebaseAuth.instance.currentUser!.uid
                                      .toString(),
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0);
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Да',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.color,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Нет',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.color,
                              ),
                            ),
                          ),
                        ],
                        title: Row(children: [
                          Text(
                            'Внимание',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.color),
                          ),
                          Icon(
                            CupertinoIcons.exclamationmark_triangle,
                            color: Theme.of(context).textTheme.bodyText2?.color,
                            size: 30,
                          ),
                        ]),
                        content: Text(
                          'Вы точно хотите сбросить прогресс обучения?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  Theme.of(context).textTheme.bodyText2?.color),
                        ),
                      )),
            ),
            SettingWidget(
              text: 'Написать разработчику',
              icon: Icon(CupertinoIcons.mail,
                  color: Theme.of(context).textTheme.bodyText2?.color,
                  size: 30),
              onTap: () {
                launchEmail();
              },
            ),
            SettingWidget(
              text: 'FAQ',
              icon: Icon(CupertinoIcons.question_circle,
                  color: Theme.of(context).textTheme.bodyText2?.color,
                  size: 30),
              onTap: _mainFAQ,
            ),
            Container(
              height: 125,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Почта: ${user.email!}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 225,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Выйти из аккаунта',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.color),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.logout,
                              color:
                                  Theme.of(context).textTheme.bodyText2?.color),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  final GestureTapCallback onTap;
  const SettingWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width / 2.6,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: InkResponse(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            icon,
          ],
        ),
      ),
    );
  }
}

class selectTheme extends StatefulWidget {
  const selectTheme({Key? key}) : super(key: key);

  @override
  _selectThemeState createState() => _selectThemeState();
}

class _selectThemeState extends State<selectTheme> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    var theme;
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _themeChanger.setTheme(CustomTheme.purpleTheme);
              Navigator.of(context, rootNavigator: true).pop();
              //_themeChanger.saveTheme(0);
            },
            child: Row(
              children: const [
                Icon(
                  CupertinoIcons.today,
                  color: Colors.purpleAccent,
                  size: 50,
                ),
                Text('фиолетовая тема',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.purpleAccent)),
              ],
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              _themeChanger.setTheme(CustomTheme.blueTheme);
              Navigator.of(context, rootNavigator: true).pop();
              //_themeChanger.saveTheme(0);
            },
            child: Row(
              children: const [
                Icon(
                  CupertinoIcons.today,
                  size: 50,
                  color: Colors.lightBlue,
                ),
                Text('синяя тема',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.lightBlue)),
              ],
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              _themeChanger.setTheme(CustomTheme.lightTheme);
              Navigator.of(context, rootNavigator: true).pop();
              //_themeChanger.saveTheme(2);
            },
            child: Row(
              children: const [
                Icon(
                  CupertinoIcons.today,
                  color: Colors.white,
                  size: 50,
                ),
                Text('белая тема',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              _themeChanger.setTheme(CustomTheme.darkTheme);
              Navigator.of(context, rootNavigator: true).pop();
              //_themeChanger.saveTheme(3);
            },
            child: Row(
              children: const [
                Icon(
                  CupertinoIcons.today,
                  color: Colors.black,
                  size: 50,
                ),
                Text('чёрная тема',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
