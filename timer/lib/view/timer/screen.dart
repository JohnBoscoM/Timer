import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timer/service/timer_service.dart';
import 'package:timer/view/timer/neu_digital_clock.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timeService = TimerService();
    return ChangeNotifierProvider<TimerService>(
      create: (_) => timeService,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).viewPadding.top + 20),
              TimerTitle(),
              SizedBox(height: 60),
              NeuDigitalClock(
                key: null,
              ),
              SizedBox(height: 20),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerTitle extends StatelessWidget {
  const TimerTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Timer',
          style: Theme.of(context).textTheme.headline1,
        ),
        Spacer(),
      ],
    );
  }
}
