import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:timer/service/timer_service.dart';
import 'package:timer/view/timer/digital_font/digital_colon.dart';

import 'digital_font/digital_number.dart';

class NeuDigitalClock extends StatefulWidget {
  const NeuDigitalClock({
    required Key? key,
  }) : super(key: key);
  @override
  _NeuDigitalClockState createState() => _NeuDigitalClockState();
}

class _NeuDigitalClockState extends State<NeuDigitalClock> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  late Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);
    // Outer white container
    return Container(
      height: 145,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          // BoxShadow(
          //   blurRadius: 15,
          //   offset: Offset(-5, -5),
          //   color: Colors.white,
          // ),
          // BoxShadow(
          //   blurRadius: 15,
          //   offset: Offset(10.5, 10.5),
          //   color: Color.fromRGBO(214, 223, 230, 1),
          // )
        ],
      ),
      // Digital green background
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            height: constraints.maxHeight * 0.87,
            width: constraints.maxWidth * 0.95,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(203, 211, 196, 1),
                Color.fromRGBO(176, 188, 163, 1)
              ]),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color.fromRGBO(168, 168, 168, 1),
                width: 2,
              ),
            ),
            child: DigitalClock(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              seconds: seconds,
              minutes: minutes,
              hours: hours,
              key: null,
            ),
          ),
        ),
      ),
    );
  }
}

class DigitalClock extends StatelessWidget {
  const DigitalClock({
    required Key? key,
    required this.height,
    required this.width,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
  }) : super(key: key);

  final num height;
  final num width;
  final int hours;
  final int minutes;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    List<DigitalNumberWithBG> hourNumber = createNumberTime(hours);
    List<DigitalNumberWithBG> minuteNumber = createNumberTime(minutes);
    List<DigitalNumberWithBG> secondNumber = createNumberTime(seconds);
    return Center(
      child: Container(
        height: height * 0.47,
        width: width * 0.70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...hourNumber,
            DigitalColon(
              height: height * 0.30,
              color: Colors.black87,
              key: null,
            ),
            ...minuteNumber,
            DigitalColon(
              height: height * 0.30,
              color: Colors.black87,
              key: null,
            ),
            ...secondNumber,
          ],
        ),
      ),
    );
  }

  List<DigitalNumberWithBG> createNumberTime(int numberTime) {
    final parsedNumberTime = numberTime % 60;
    final isNumberTimeTwoDigits = isNumberTwoDigits(parsedNumberTime);
    final firstNumber = firstDigit(parsedNumberTime);
    final tenDigit = isNumberTimeTwoDigits ? firstNumber : 0;
    final digit = isNumberTimeTwoDigits
        ? int.parse(parsedNumberTime.toString()[1])
        : firstNumber;

    return [
      DigitalNumberWithBG(
        height: height * 0.35,
        value: tenDigit,
        color: null,
        key: null,
        padLeft: null,
      ),
      DigitalNumberWithBG(
        height: height * 0.35,
        value: digit,
        key: null,
        color: null,
        padLeft: null,
      ),
    ];
  }
}

class DigitalNumberWithBG extends StatelessWidget {
  const DigitalNumberWithBG({
    required Key? key,
    this.value = 0,
    required this.padLeft,
    required this.height,
    required this.color,
    this.backgroundValue = 8,
  }) : super(key: key);

  final int value;
  final int backgroundValue;
  final int? padLeft;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Foreground
        DigitalNumber(
          value: value,
          color: Colors.black,
          height: height,
          key: null,
        ),

        // Background
        DigitalNumber(
          value: backgroundValue,
          color: Colors.black12,
          height: height,
          key: null,
        ),
      ],
    );
  }
}

bool isNumberTwoDigits(int number) {
  return number.toString().length == 2;
}

int firstDigit(int number) {
  return int.parse(number.toString()[0]);
}
