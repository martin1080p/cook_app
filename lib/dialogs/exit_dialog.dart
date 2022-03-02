import 'package:cook_app/providers/interval_timer_provider.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Warning'),
      content: const Text('Are you sure you want to stop cooking?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
              context.read<IntervalTimer>().stopTimer();
            },
            child: const Text("Yes")),
        TextButton(
            onPressed: () {
              Navigator.pop(context, false);
              context.read<IntervalTimer>().resumeTimer();
            },
            child: const Text("No"))
      ],
    );
  }
}
