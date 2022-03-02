import 'package:cook_app/modals/cook_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';



class HomeScreen extends StatelessWidget{

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){

            FlutterRingtonePlayer.playNotification();

            showModalBottomSheet<void>(
              context: context,
              isDismissible: false,
              builder: (BuildContext context){
                return const CookModal();
              }
            );
          },
          child: const Text(
            "Let's cook!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}