import 'package:flutter/material.dart';

class CardDisplay extends StatefulWidget {
  final String name;
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String imageUrl;
  final String power;
  final String combat;

  CardDisplay(
      {required this.imageUrl,
      required this.name,
      required this.intelligence,
      required this.strength,
      required this.speed,
      required this.durability,
      required this.power,
      required this.combat});

  @override
  _CardDisplayState createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Column(
        children: [
          Image.network(widget.imageUrl),
          Text('name: ${widget.name}'),
          Text('intelligence: ${widget.intelligence}'),
          Text('strength: ${widget.strength}'),
          Text('speed: ${widget.speed}'),
          Text('durability: ${widget.durability}'),
          Text('power: ${widget.power}'),
          Text('combat: ${widget.combat}'),
          ElevatedButton(
              onPressed: () {
                setState(
                  () {},
                );
              },
              child: Text('Next Card'))
        ],
      ),
    );
  }
}
