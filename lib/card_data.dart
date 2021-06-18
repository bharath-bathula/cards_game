import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dio/dio.dart';

import './hero_model.dart';

class CardData extends StatefulWidget {
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
      body: FutureBuilder<HeroModel>(
          future: data,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData) {
              return SafeArea(
                child: Card(
                  margin: EdgeInsets.all(7),
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('${snapshot.data!.name}')),
                      Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              snapshot.data!.image.url,
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
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'intelligence: ${snapshot.data!.biography.publisher}'),
                      Text(
                          'intelligence: ${snapshot.data!.powerstats.intelligence}'),
                      Text('strength: ${snapshot.data!.powerstats.strength}'),
                      Text('speed: ${snapshot.data!.powerstats.speed}'),
                      Text(
                          'durability: ${snapshot.data!.powerstats.durability}'),
                      Text('power: ${snapshot.data!.powerstats.power}'),
                      Text('combat: ${snapshot.data!.powerstats.combat}'),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                              color: Colors.greenAccent,
                            ),
                            SizedBox(
                              width: 40,
                            ),
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
                              color: Colors.redAccent,
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
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
    );
  }
}

int randomGen() {
  Random random = new Random();
  int id = random.nextInt(730) + 1;
  print(id);
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

  print(heroModel.id);
  print(heroModel.name);
  print(heroModel.image);
  print(heroModel.powerstats);

  return heroModel;
}
