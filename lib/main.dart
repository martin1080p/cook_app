import 'package:cook_app/screens/cook_two_screen.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/cook_one_screen.dart';
import './providers/interval_timer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<IntervalTimer>(
      create: (_) => IntervalTimer(), child: const CookApp()));
}

class CookApp extends StatelessWidget {
  const CookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook app',
      theme: ThemeData(
          primarySwatch: Colors.red,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red,
          ).copyWith()),
      routes: {
        '/': (context) => const HomeScreen(title: "👨‍🍳 Cook App"),
        '/first': (context) => const CookOne(title: "First step"),
        '/second': (context) => const CookTwo(title: "Second step"),
      },
      initialRoute: '/',
    );
  }
}
