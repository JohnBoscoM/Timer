import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/service/timer_service.dart';

class StartButton extends StatefulWidget {
  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  bool _isPressed = false;
  bool _isRunning = false;

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
          _isRunning
              ? Provider.of<TimerService>(context, listen: false).stop()
              : Provider.of<TimerService>(context, listen: false).start();
          setState(() => _isRunning = !_isRunning);
        },
        onPointerUp: _onPointerUp,
        child: FloatingActionButton(
            backgroundColor: Colors.grey.shade800,
            child: Icon(
              Icons.play_arrow,
              size: 35,
            ),
            onPressed: () {
              _isRunning = true;
            }));
  }
}
