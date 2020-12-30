import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  final ThemeData themeLight = ThemeData(
    primarySwatch: Colors.blueGrey,
    accentColor: Colors.teal,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.teal,
      ),
      initialRoute: Modular.initialRoute,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    ).modular();
  }
}
