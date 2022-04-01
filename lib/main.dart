// ignore_for_file: must_be_immutable, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pylearn/mainMenu/mainMenu.dart';
import 'package:pylearn/Utils/themes.dart';
import 'Utils/realTimeDatabase.dart';
import 'signInAndSignUp/loginPage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(CustomTheme.purpleTheme),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PyLearn',
        home: AnimatedSplashScreen(
          splash: Image.asset(
            'lib/assets/python.png',
          ),
          splashIconSize: 125,
          backgroundColor: const Color(0xffF5E4FF),
          duration: 1000,
          nextScreen: const MainPage(),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeChanger>(context).getTheme(),
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MainMenu();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
