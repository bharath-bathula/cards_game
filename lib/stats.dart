import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  final int won;
  final int lost;
  Stats({
    required this.won,
    required this.lost,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(child: Text('Wins : $won')),
            Container(child: Text('Lost : $lost')),
            Container(
                child: won > lost
                    ? Text('You Win')
                    : won == lost
                        ? Text('Its a Draw')
                        : Text('You Lost')),
            IconButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => false);
                },
                icon: Icon(Icons.home))
          ],
        ),
      ),
    );
  }
}
