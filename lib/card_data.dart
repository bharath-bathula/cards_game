import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cards_game/guide.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import './logic.dart';
import './hero_model.dart';
import './stats.dart';

class CardData extends StatefulWidget {
  static const route = 'cardData';
  const CardData({Key? key}) : super(key: key);

  @override
  _CardDataState createState() => _CardDataState();
}

class _CardDataState extends State<CardData> {
  late Future<HeroModel> data = dataReturn();
  int wins = 0;
  int lost = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<HeroModel>(
            future: data,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasData) {
                return Container(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, Stats.route,
                                    arguments: ScreenArguments(wins, lost));
                              },
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: Icon(
                                  Icons.exit_to_app_rounded,
                                  size: 32,
                                ),
                              ),
                              padding: EdgeInsets.all(8),
                              elevation: 0,
                            ),
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.5,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: FittedBox(
                                child: Text(
                                  '${snapshot.data!.name}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Color(0xFF657d6b)),
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Guide.route);
                              },
                              child: Text(
                                '?',
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              padding: EdgeInsets.all(8),
                              elevation: 0,
                            ),
                          ],
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(7),
                        elevation: 30,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/cardbackground.jpg',
                                  ),
                                  fit: BoxFit.cover)),
                          child: Column(children: [
                            Stack(children: [
                              Container(
                                margin: EdgeInsets.all(12),
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.7),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data!.image.url,
                                        ),
                                        fit: BoxFit.cover)),
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 2.0, sigmaY: 2.0),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data!.image.url,
                                      // placeholder: (context, url) => Center(
                                      //     child: Image.asset(
                                      //   'assets/unnamed.gif',
                                      //   fit: BoxFit.cover,
                                      // )),
                                      // Image(
                                      //   image: AssetImage('assets/loading.png'),
                                      //   fit: BoxFit.fitHeight,
                                      // ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    //  Image(
                                    //   fit: BoxFit.fitHeight,
                                    //   image: NetworkImage(
                                    //     snapshot.data!.image.url,
                                    //   ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.431,
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.white,
                                    ],
                                  )),
                                ),
                              ),
                            ]),
                            Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.fromLTRB(12, 6, 12, 12),
                              color: Color(0xffEFBF2F),
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: 'Marvel Comics' ==
                                            snapshot.data!.biography.publisher
                                        ? Image.asset('assets/marvelcomics.jpg')
                                        : 'DC Comics' ==
                                                snapshot
                                                    .data!.biography.publisher
                                            ? Image.asset('assets/dccomic.png')
                                            : Text(
                                                snapshot
                                                    .data!.biography.publisher,
                                                style: TextStyle(fontSize: 28),
                                              ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Intelligence',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            'Strength',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            'Speed',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            'Durability',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            'Power',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            'Combat',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            'Height',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            'Weight',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ': ${snapshot.data!.powerstats.intelligence}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            ': ${snapshot.data!.powerstats.strength}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            ': ${snapshot.data!.powerstats.speed}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            ': ${snapshot.data!.powerstats.durability}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            ': ${snapshot.data!.powerstats.power}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            ': ${snapshot.data!.powerstats.combat}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            ': ${snapshot.data!.appearance.height[1]}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                          Text(
                                            ': ${snapshot.data!.appearance.weight[1]}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff41A6DE),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              lost++;
                              print("lost");

                              if (wins + lost >= 60) {
                                Navigator.pushNamed(context, Stats.route,
                                    arguments: ScreenArguments(wins, lost));
                              } else {
                                setState(() {
                                  data = dataReturn();
                                });
                              }
                            },
                            child: Icon(
                              Icons.close_rounded,
                              size: 32,
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                            color: Color(0xffE00724),
                          ),
                          MaterialButton(
                            onPressed: () {
                              wins++;
                              print("wins");
                              print(wins);

                              if (wins + lost >= 60) {
                                Navigator.pushNamed(context, Stats.route,
                                    arguments: ScreenArguments(wins, lost));
                              } else {
                                setState(() {
                                  data = dataReturn();
                                });
                              }
                            },
                            child: Icon(
                              Icons.check,
                              size: 32,
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                            color: Color(0xff2E7C6C),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                showDialog(context: context, builder: (_) => (Text("Error")));
              }
              return Center(
                child: Image.asset('assets/loading.gif'),
              );
            }),
      ),
    );
  }
}
