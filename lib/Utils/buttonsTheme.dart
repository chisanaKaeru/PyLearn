// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;
  final String text;
  final double precent;

  const CircleButton({
    Key? key,
    required this.onTap,
    required this.iconData,
    required this.text,
    required this.precent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 90;

    return SizedBox(
      width: 155,
      height: 155,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -15,
                left: -15,
                child: Center(
                  child: CircularPercentIndicator(
                    radius: 60,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 10,
                    percent: precent,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    progressColor: Colors.yellowAccent,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ),
              ),
              InkResponse(
                onTap: onTap,
                child: Container(
                  width: size,
                  height: size,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      iconData,
                      color: Theme.of(context).colorScheme.primary,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
