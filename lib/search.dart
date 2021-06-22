import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import './hero_model.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellow[600],
        child: Icon(Icons.exit_to_app_outlined),
        onPressed: () {},
        mini: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: FutureBuilder<HeroModel>(
          future: dataReturn(),
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
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    // padding: const EdgeInsets.all(8.0),
                    child: ListView(children: [
                      Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            '${snapshot.data!.name}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Color(0xFF657d6b)),
                          )),
                      Stack(children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 8,
                            ),
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
                          height: MediaQuery.of(context).size.height * 0.43,
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
                      Container(
                        height: 45,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: 'Marvel Comics' ==
                                  snapshot.data!.biography.publisher
                              ? Image.asset('assets/marvelcomics.jpg')
                              : 'DC Comics' ==
                                      snapshot.data!.biography.publisher
                                  ? Image.asset('assets/dccomics.png')
                                  : Text(
                                      snapshot.data!.biography.publisher,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Intelligence',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Strength',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Speed',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Durability',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Power',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Combat',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ': ${snapshot.data!.powerstats.intelligence}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ': ${snapshot.data!.powerstats.strength}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ': ${snapshot.data!.powerstats.speed}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ': ${snapshot.data!.powerstats.durability}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ': ${snapshot.data!.powerstats.power}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ': ${snapshot.data!.powerstats.combat}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                // setState(() {
                                //   wins++;
                                //   print("wins");

                                //   print(wins);
                                //   data = dataReturn();
                                // });
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
                                // setState(() {
                                //   lost++;
                                //   print("lost");

                                //   print(lost);

                                //   data = dataReturn();
                                // });
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

  return heroModel;
}
