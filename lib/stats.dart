import 'package:cards_game/start_page.dart';
import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  static const route = 'stats';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Stats'),
      // ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Game Stats',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child: Text(
                    'Wins',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )),
                  Container(
                      child: Text(
                    'Lost',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child: Text(
                    args.win.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )),
                  Container(
                      child: Text(
                    args.lost.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  child: args.win > args.lost
                      ? Text(
                          'You Win',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.green),
                        )
                      : args.win == args.lost
                          ? Text(
                              'Its a Draw',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.brown),
                            )
                          : Text(
                              'You Lost',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.red),
                            )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, StartPage.route);
                  },
                  icon: Icon(
                    Icons.home,
                    size: 40,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenArguments {
  final int win;
  final int lost;

  ScreenArguments(this.win, this.lost);
}
