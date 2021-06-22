import 'dart:math';

import 'package:dio/dio.dart';

import './hero_model.dart';

// int randomGen() {
//   Random random = new ;
//   int id = random.nextInt(730) + 1;
//   return id;
// }

Future<HeroModel> dataReturn() async {
  var dio = Dio();

  int id = Random().nextInt(730) + 1;

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
      heroModel.appearance.height[1] == '0 cm' ||
      // ignore: unnecessary_null_comparison
      heroModel.appearance.weight[1] == '0 kg') {
    print('inside if statement');
    return dataReturn();
  } else {
    print('inside else statement');

    heroModal = heroModel;
    return heroModal;
  }
}
