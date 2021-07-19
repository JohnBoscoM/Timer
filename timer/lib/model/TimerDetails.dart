import 'package:flutter/foundation.dart';
class TimerDetails extends ChangeNotifier
{
   late int _remainingTime;
  int getRemainingTime() => _remainingTime;

  updateRemainingTime()
  {
    _remainingTime--;
    notifyListeners();
  }
}