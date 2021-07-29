import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/service/timer_service.dart';

class ResetButton extends StatefulWidget {
  @override
  _ResetButtonState createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  bool _isPressed = false;

  void _onPointerDown() {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (_) {
          _onPointerDown();
          final isRunning =
              Provider.of<TimerService>(context, listen: false).isRunning;
          Provider.of<TimerService>(context, listen: false).reset();
          // If user press reset button when timer is running, start for them
          if (isRunning)
            Provider.of<TimerService>(context, listen: false).start();
        },
        onPointerUp: _onPointerUp,
        child: AnimatedContainer(
          duration: Duration.zero,
          child: Icon(
            CupertinoIcons.delete_simple,
            size: 30,
          ),
        ));
  }
}
