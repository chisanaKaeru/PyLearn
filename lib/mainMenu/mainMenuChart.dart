// ignore_for_file: camel_case_types, file_names, must_be_immutable, unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';

import '../Utils/realTimeDatabase.dart';

class mainMenuChart extends StatefulWidget {
  const mainMenuChart({Key? key}) : super(key: key);

  @override
  _mainMenuChartState createState() => _mainMenuChartState();
}

class _mainMenuChartState extends State<mainMenuChart> {
  final screenshotControllerOne = ScreenshotController();
  final screenshotControllerTwo = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Screenshot(
              controller: screenshotControllerOne,
              child: ChartWidget(),
            ),
            const SizedBox(height: 8),
            SizedBox(
                width: 310,
                height: 45,
                child: ElevatedButton(
                    onPressed: () async {
                      final uint8List = await screenshotControllerOne.capture();
                      const text =
                          'Вот так вот выглядит моя продуктивная неделя! А как выглядит твоя?';
                      shareImage(uint8List, text);
                    },
                    child: Text(
                      'Поделиться продуктивностью недели',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2?.color),
                    ))),
            const SizedBox(height: 25),
            Screenshot(
                controller: screenshotControllerTwo,
                child: const TableCalendarWidget()),
            const SizedBox(height: 8),
            SizedBox(
                width: 310,
                height: 45,
                child: ElevatedButton(
                    onPressed: () async {
                      final uint8List = await screenshotControllerTwo.capture();
                      const text =
                          'Это мои горячие дни недели! А какие у тебя горячие дни на этой неделе?';
                      shareImage(uint8List, text);
                    },
                    child: Text(
                      'Поделиться горячими днями недели',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2?.color),
                    ))),
          ],
        ),
      ),
    );
  }

  shareImage(uint8List, text) async {
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/image.png');
    file.writeAsBytesSync(uint8List!);
    await Share.shareFiles([file.path], text: text);
  }
}

class TableCalendarWidget extends StatelessWidget {
  const TableCalendarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        child: TableCalendar(
            locale: 'ru_RU',
            firstDay: DateTime.now(),
            lastDay: DateTime.now(),
            focusedDay: DateTime.now(),
            headerVisible: false,
            rowHeight: 40,
            calendarStyle: CalendarStyle(
              todayDecoration: const BoxDecoration(
                color: Color(0xFFDA1313),
                shape: BoxShape.circle,
              ),
              selectedDecoration: const BoxDecoration(
                color: Color(0xFFDA1313),
                shape: BoxShape.circle,
              ),
              disabledTextStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2?.color,
                  fontSize: 14),
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Color(0xFF000000), fontSize: 16),
              weekendStyle: TextStyle(color: Color(0xFFFF8181), fontSize: 16),
            )),
      ),
    );
  }
}

class ChartWidget extends StatelessWidget {
  ChartWidget({
    Key? key,
  }) : super(key: key);
  final List<Color> gradientColor = [
    const Color(0xff53B1F9),
    const Color(0xff38A636)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 375,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 10),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: false),
            maxX: 700,
            minX: 0,
            maxY: 100,
            minY: 0,
            titlesData: FlTitlesData(
              show: true,
              topTitles: SideTitles(showTitles: false),
              leftTitles: SideTitles(showTitles: false),
              rightTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                margin: 0,
                getTextStyles: (context, value) => const TextStyle(
                  fontSize: 14,
                ),
              ),
              bottomTitles: SideTitles(
                getTextStyles: (context, value) => const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                showTitles: true,
                reservedSize: 20,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 100:
                      return 'Пон';
                    case 200:
                      return 'Вто';
                    case 300:
                      return 'Cре';
                    case 400:
                      return 'Чет';
                    case 500:
                      return 'Пят';
                    case 600:
                      return 'Суб';
                    case 700:
                      return 'Вос';
                  }
                  return '';
                },
                margin: 8,
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(strokeWidth: 1, color: Colors.white);
              },
            ),
            borderData: FlBorderData(
              border: Border.all(color: Colors.white),
            ),
            lineBarsData: [
              LineChartBarData(
                colors: gradientColor,
                isCurved: true,
                barWidth: 5,
                spots: [
                  FlSpot(700, sunday),
                  FlSpot(600, saturday),
                  FlSpot(500, friday),
                  FlSpot(400, thursday),
                  FlSpot(300, wednesday),
                  FlSpot(200, tuesday),
                  FlSpot(100, monday),
                  const FlSpot(0, 50),
                ],
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColor
                      .map(
                        (color) => color.withOpacity(0.3),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
