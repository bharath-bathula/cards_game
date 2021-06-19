import 'package:flutter/material.dart';

import './card_data.dart';

class StartPage extends StatelessWidget {
  static const route = 'start';
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Cards Game'),
      ),
      body: Container(
        child: ElevatedButton(
          child: Text('Start Game'),
          onPressed: () {
            Navigator.pushNamed(context, CardData.route);
          },
        ),
      ),
    );
  }
}
