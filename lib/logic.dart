import 'package:dio/dio.dart';

import './hero_model.dart';

Future<HeroModel> dataReturn(int id) async {
  var dio = Dio();
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
