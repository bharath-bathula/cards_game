import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dio/dio.dart';

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
                              child: Icon(
                                Icons.exit_to_app_rounded,
                                size: 32,
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
                              child: Text(
                                '${snapshot.data!.name}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    color: Color(0xFF657d6b)),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.question_answer_sharp,
                                size: 32,
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
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/cardbackground.jpg',
                                  ),
                                  fit: BoxFit.cover)),
                          // height: MediaQuery.of(context).size.height * 0.718,
                          // padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Stack(children: [
                              Container(
                                margin: EdgeInsets.all(12),
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data!.image.url,
                                        ),
                                        fit: BoxFit.cover)),
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 2.0, sigmaY: 2.0),
                                    child: Image(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(
                                        snapshot.data!.image.url,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Positioned(
                              //   top: MediaQuery.of(context).size.height * 0.431,
                              //   child: Container(
                              //     height: 60,
                              //     width: MediaQuery.of(context).size.width,
                              //     decoration: BoxDecoration(
                              //         gradient: LinearGradient(
                              //       begin: Alignment.topCenter,
                              //       end: Alignment.bottomCenter,
                              //       colors: [
                              //         Colors.transparent,
                              //         Colors.white,
                              //       ],
                              //     )),
                              //   ),
                              // ),
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
                                            ? Image.asset('assets/dccomics.png')
                                            : Text(
                                                snapshot
                                                    .data!.biography.publisher,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
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
                              setState(() {
                                lost++;
                                print("lost");

                                print(lost);

                                data = dataReturn();
                              });
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
                              setState(() {
                                wins++;
                                print("wins");

                                print(wins);
                                data = dataReturn();
                              });
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
              return Column(
                children: [
                  Text('went to return'),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }),
      ),
    );
  }
}

int randomGen() {
  Random random = new Random();
  int id = random.nextInt(730) + 1;
  return id;
}

Future<HeroModel> dataReturn() async {
  var dio = Dio();

  int id = randomGen();

  var heroData =
      await dio.get('https://superheroapi.com/api/3987559941340811/$id');
  print('step1');

  print(heroData.data['name']);

  var heroModel = HeroModel.fromJson(heroData.data);
  var heroModal;

  print(heroModel.id);
  print(heroModel.name);
  print(heroModel.image);
  print(heroModel.powerstats);

  // ignore: unnecessary_null_comparison
  if (heroModel.name == 'null' ||
      // ignore: unnecessary_null_comparison
      heroModel.image.url == 'null' ||
      // ignore: unnecessary_null_comparison
      heroModel.powerstats.combat == 'null' ||
      // ignore: unnecessary_null_comparison
      heroModel.powerstats.durability == 'null' ||
      // ignore: unnecessary_null_comparison
      heroModel.powerstats.intelligence == 'null' ||
      // ignore: unnecessary_null_comparison
      heroModel.powerstats.power == 'null' ||
      // ignore: unnecessary_null_comparison
      heroModel.powerstats.speed == 'null' ||
      // ignore: unnecessary_null_comparison
      heroModel.appearance.height == null ||
      // ignore: unnecessary_null_comparison
      heroModel.appearance.weight == null) {
    var dio = Dio();

    int id = randomGen();

    var heroData =
        await dio.get('https://superheroapi.com/api/3987559941340811/$id');
    print('step1');

    print(heroData.data['name']);

    var heroModel = HeroModel.fromJson(heroData.data);
    heroModal = heroModel;
  } else {
    heroModal = heroModel;
  }
  return heroModal;
}
