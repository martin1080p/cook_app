import 'package:cook_app/modals/end_modal.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter/material.dart';
import 'dart:async' as asy;

class IntervalTimer extends ChangeNotifier {
  int timerCount = 120;
  Color? timerColor = Colors.green;
  String timerFormat = "";

  late asy.Timer timer;

  int get interval => timerCount;
  Color? get color => timerColor;
  String get format => timerFormat;

  void startTimer() {
    timerCount = 120;
    resumeTimer();
  }

  void decrementCount() {
    timerCount--;
    timerColor = Color.lerp(Colors.red, Colors.green, timerCount / 120);
    timerFormat = (timerCount / 60).floor().toString().padLeft(2, "0") +
        ":" +
        (timerCount % 60).toString().padLeft(2, "0");

    if (timerCount == 0) {
      stopTimer();
    }

    notifyListeners();
  }

  void resumeTimer() {
    timer = asy.Timer.periodic(const Duration(seconds: 1), (t) {
      decrementCount();
      timer = t;
    });
  }

  void pauseTimer() {
    if (timer.isActive) {
      timer.cancel();
    }
    notifyListeners();
  }

  void stopTimer() {
    if (timer.isActive) {
      timer.cancel();
    }
    //notifyListeners();
  }

  Widget secondScreen(BuildContext ctx) {
    if (timerCount == 61) {
      return Builder(
        builder: (context) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushNamed(ctx, '/second');
          });
          return Container();
        },
      );
    }

    return Container();
  }

  Widget endScreen() {
    if (timerCount == 0) {
      return Builder(builder: (context) {
        Future.delayed(const Duration(seconds: 1), () {
          stopTimer();
          showModalBottomSheet<void>(
              isDismissible: false,
              context: context,
              builder: (BuildContext context) {
                FlutterRingtonePlayer.playNotification();
                return const EndModal();
              });
        });
        return Container();
      });
    }
    return Container();
  }

  void reset() {
    timerColor = Colors.green;
    timerFormat = "02:00";
  }
}
