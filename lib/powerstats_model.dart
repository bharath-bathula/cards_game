// To parse this JSON data, do
//
//     final powerStats = powerStatsFromJson(jsonString);

import 'dart:convert';

PowerStats powerStatsFromJson(String str) =>
    PowerStats.fromJson(json.decode(str));

String powerStatsToJson(PowerStats data) => json.encode(data.toJson());

class PowerStats {
  PowerStats({
    required this.response,
    required this.id,
    required this.name,
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  String response;
  String id;
  String name;
  String intelligence;
  String strength;
  String speed;
  String durability;
  String power;
  String combat;

  factory PowerStats.fromJson(Map<String, dynamic> json) => PowerStats(
        response: json["response"],
        id: json["id"],
        name: json["name"],
        intelligence: json["intelligence"],
        strength: json["strength"],
        speed: json["speed"],
        durability: json["durability"],
        power: json["power"],
        combat: json["combat"],
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "id": id,
        "name": name,
        "intelligence": intelligence,
        "strength": strength,
        "speed": speed,
        "durability": durability,
        "power": power,
        "combat": combat,
      };
}
