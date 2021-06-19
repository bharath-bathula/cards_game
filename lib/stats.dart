import 'package:cards_game/start_page.dart';
import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  static const route = 'stats';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(child: Text('Wins : ${args.win}')),
            Container(child: Text('Lost : ${args.lost}')),
            Container(
                child: args.win > args.lost
                    ? Text('You Win')
                    : args.win == args.lost
                        ? Text('Its a Draw')
                        : Text('You Lost')),
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, StartPage.route);
                },
                icon: Icon(Icons.home))
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final int win;
  final int lost;

  ScreenArguments(this.win, this.lost);
}
