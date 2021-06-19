import 'package:cards_game/card_data.dart';
import 'package:flutter/material.dart';
import './start_page.dart';
import './stats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: StartPage(),
      initialRoute: StartPage.route,
      routes: {
        StartPage.route: (context) => StartPage(),
        CardData.route: (context) => CardData(),
        Stats.route: (context) => Stats(),
      },
    );
  }
}
