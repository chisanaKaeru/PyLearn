// ignore_for_file: unnecessary_import, unused_import, import_of_legacy_library_into_null_safe, camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:bottom_bar/bottom_bar.dart';

import '../Utils/realTimeDatabase.dart';
import 'mainMenuChart.dart';
import 'mainMenuSettings.dart';
import 'mainMenuTheme.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _currentPage = 0;

  final _pageController = PageController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          mainMenuTheme(),
          mainMenuChart(),
          mainMenuSettings(),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomBar(
            height: 75,
            selectedIndex: _currentPage,
            onTap: (int index) {
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => super.widget));
              _pageController.jumpToPage(index);
              setState(() {
                _currentPage = index;
              });
            },
            items: [
              BottomBarItem(
                icon: const Icon(CupertinoIcons.book_fill, size: 35),
                title: const Text('Главная'),
                inactiveColor: Theme.of(context).colorScheme.secondary,
                inactiveIcon: const SizedBox(
                    width: 80, child: Icon(CupertinoIcons.book, size: 35)),
                activeColor: Theme.of(context).colorScheme.onPrimary,
              ),
              BottomBarItem(
                icon:
                    const Icon(CupertinoIcons.chart_bar_square_fill, size: 35),
                title: const Text('Статистика'),
                inactiveIcon: const SizedBox(
                    width: 80,
                    child: Icon(CupertinoIcons.chart_bar_square, size: 35)),
                inactiveColor: Theme.of(context).colorScheme.secondary,
                activeColor: Theme.of(context).colorScheme.onSecondary,
              ),
              BottomBarItem(
                icon: const Icon(CupertinoIcons.gear_alt_fill, size: 35),
                title: const Text('Настройки'),
                inactiveIcon: const SizedBox(
                    width: 80, child: Icon(CupertinoIcons.gear_alt, size: 35)),
                inactiveColor: Theme.of(context).colorScheme.secondary,
                activeColor: Theme.of(context).colorScheme.onBackground,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
