import 'package:flutter/material.dart';
import 'package:cook_app/providers/interval_timer_provider.dart';
import 'package:provider/provider.dart';


class CookModal extends StatelessWidget {

  const CookModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        height: 100,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "You are about to start cooking...",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            TextButton(
              onPressed: (){
                context.read<IntervalTimer>().reset();
                Navigator.pop(context);
                Navigator.pushNamed(context, '/first');
                context.read<IntervalTimer>().startTimer();
              },
              child: const Text(
                "Continue"
              ),
            )
          ],
        ),
      ),
    );
  }
}