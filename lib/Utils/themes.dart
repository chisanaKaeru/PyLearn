import 'package:flutter/material.dart';

class CustomTheme {
  static final purpleTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff602DA0),
    backgroundColor: const Color(0xff602DA0),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff602DA0)),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff6C3DA8),
      secondary: Colors.white38,
      onPrimary: Colors.greenAccent,
      onSecondary: Colors.yellowAccent,
      onBackground: Colors.pinkAccent,
    ),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white12),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ),
  );
  static final blueTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF2D63A0),
    backgroundColor: const Color(0xFF2D63A0),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF2D63A0)),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFF3E76B6),
        secondary: Colors.white38,
        onPrimary: Colors.redAccent,
        onSecondary: Colors.greenAccent,
        onBackground: Colors.amberAccent),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white12),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFDFDFD),
    backgroundColor: const Color(0xFFFDFDFD),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFDFDFD)),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xFFD2D2D2),
      secondary: Colors.black38,
      onPrimary: Colors.purpleAccent,
      onSecondary: Colors.blueAccent,
      onBackground: Colors.redAccent,
    ),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black54)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white12),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ),
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF2C2C2C),
    backgroundColor: const Color(0xFF2C2C2C),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF2C2C2C)),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xFF3F3F3F),
      secondary: Colors.white38,
      onPrimary: Colors.yellowAccent,
      onSecondary: Colors.redAccent,
      onBackground: Colors.blueAccent,
    ),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white12),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ),
  );
}

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(
    this._themeData,
  );
  getTheme() => _themeData;
  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
