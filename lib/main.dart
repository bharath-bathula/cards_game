import 'package:flutter/material.dart';

import './card_data.dart';
import './guide.dart';
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
      title: 'Classic Comic Cards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'ComicBooks'),
      // home: StartPage(),
      initialRoute: StartPage.route,
      routes: {
        StartPage.route: (context) => StartPage(),
        CardData.route: (context) => CardData(),
        Stats.route: (context) => Stats(),
        Guide.route: (context) => Guide(),
      },
    );
  }
}
