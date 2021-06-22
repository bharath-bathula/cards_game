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
          child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xffF98700)),
                child: Text('Start Game'),
                onPressed: () {
                  Navigator.pushNamed(context, CardData.route);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.29,
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
