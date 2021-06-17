import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dio/dio.dart';

import './hero_model.dart';

import './card_display.dart';

class CardData extends StatefulWidget {
  const CardData({Key? key}) : super(key: key);

  @override
  _CardDataState createState() => _CardDataState();
}

class _CardDataState extends State<CardData> {
  late Future<HeroModel> data = dataReturn();

  // @override
  // void initState() {
  //   super.initState();
  //   data = dataReturn();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SuperHeros'),
      ),
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
              return CardDisplay(
                  imageUrl: snapshot.data!.image.url,
                  name: snapshot.data!.name,
                  intelligence: snapshot.data!.powerstats.intelligence,
                  strength: snapshot.data!.powerstats.strength,
                  speed: snapshot.data!.powerstats.speed,
                  durability: snapshot.data!.powerstats.durability,
                  power: snapshot.data!.powerstats.power,
                  combat: snapshot.data!.powerstats.combat);
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

Future<HeroModel> dataReturn() async {
  var dio = Dio();
  Random random = new Random();
  int id = random.nextInt(730) + 1;
  print(id);

  var heroData =
      await dio.get('https://superheroapi.com/api/3987559941340811/$id');
  print('step1');
  // print(heroData);
  // print('now data');
  print(heroData.data['name']);

  // final heroModal = heroModelFromJson(heroData.data);
  // print(heroModal);
  // print('step2');

  var heroModel = HeroModel.fromJson(heroData.data);

  print(heroModel.id);
  print(heroModel.name);
  print(heroModel.image);
  print(heroModel.powerstats);

  return heroModel;
}
