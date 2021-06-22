import 'package:cards_game/start_page.dart';
import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  static const route = 'stats';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      body: SafeArea(
        child: args.win > args.lost
            ? Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/hero.png',
                        ),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Text(
                          'Wins',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        )),
                        Container(
                            child: Text(
                          'Lost',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        )),
                        Container(
                            child: Text(
                          args.lost.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
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
              )
            : args.win == args.lost
                ? Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/draw.jpg',
                            ),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/spvsbm.png',
                          fit: BoxFit.fitWidth,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: Text(
                              'Wins',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            )),
                            Container(
                                child: Text(
                              'Lost',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            )),
                            Container(
                                child: Text(
                              args.lost.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, StartPage.route);
                            },
                            icon: Icon(
                              Icons.home,
                              size: 40,
                            )),
                        Image.asset(
                          'assets/cpvsim.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/lost.png',
                            ),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    child: Text(
                                  'Wins',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )),
                                Container(
                                    child: Text(
                                  'Lost',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )),
                                Container(
                                    child: Text(
                                  args.lost.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, StartPage.route);
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
