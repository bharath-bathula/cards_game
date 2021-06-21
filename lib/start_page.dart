import 'package:flutter/material.dart';

import './card_data.dart';

class StartPage extends StatelessWidget {
  static const route = 'start';
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome to Cards Game'),
      // ),
      body: SafeArea(
        child: Stack(children: [
          Image.asset(
            'assets/startbg.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.65,
            left: MediaQuery.of(context).size.width * 0.375,
            child: ElevatedButton(
              child: Text('Start Game'),
              onPressed: () {
                Navigator.pushNamed(context, CardData.route);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
