import 'package:flutter/material.dart';

import './card_data.dart';
import './guide.dart';

class StartPage extends StatelessWidget {
  static const route = 'start';
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xff012257)),
                child: Text(
                  'How to Play',
                  style: TextStyle(fontSize: 14),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Guide.route);
                },
              ),
              SizedBox(
                height: 75,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xffF98700)),
                child: Text(
                  'Start Game',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CardData.route);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.288,
              ),
              Image.asset('assets/superheroflying.png'),
            ],
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/bg.jpg',
                ),
                fit: BoxFit.cover)),
      )),
    );
  }
}
