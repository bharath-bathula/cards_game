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
              return Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView(children: [
                    Stack(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          snapshot.data!.image.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Text(snapshot.data!.id),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text('${snapshot.data!.name}')),
                          ],
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
                    Text('intelligence: ${snapshot.data!.biography.publisher}'),
                    // Image.network(snapshot.data!.image.url),
                    Text(
                        'intelligence: ${snapshot.data!.powerstats.intelligence}'),
                    Text('strength: ${snapshot.data!.powerstats.strength}'),
                    Text('speed: ${snapshot.data!.powerstats.speed}'),
                    Text('durability: ${snapshot.data!.powerstats.durability}'),
                    Text('power: ${snapshot.data!.powerstats.power}'),
                    Text('combat: ${snapshot.data!.powerstats.combat}'),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('End Game'),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  data = dataReturn();

                                  print('SetState');
                                });
                              },
                              child: Text('Next Card'))
                        ],
                      ),
                    ),
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
