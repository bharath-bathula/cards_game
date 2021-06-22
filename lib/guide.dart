import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  const Guide({Key? key}) : super(key: key);
  static const route = 'guide';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'HOW TO PLAY',
          style: TextStyle(
            // fontStyle: FontStyle.italic,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset('assets/guide.png'),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  '''• Decide who goes first. \n
• The first person calls a category and the accompanying number e.g., "POWER : 89". \n
• The other player must the call at the same category that appears on their card. \n
• The player with the highest under the the selected category wins the round.\n
• The winner will tap the Win(Green) button. \n
• The loser will tap the Lost(Red) button. \n
• The  winner of each round chooses first in the next round. \n
• In the case of a draw within a round both players tap on Win button.\n
• After drawing 60 cards the game will end.\n
• The player with more wins will be the winner''',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
