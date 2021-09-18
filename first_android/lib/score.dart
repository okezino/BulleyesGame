import 'package:flutter/material.dart';
import 'package:first_android/label.dart';
import 'package:first_android/about.dart';

class Score extends StatelessWidget {
  Score({Key? key, required this.finalScore, required this.round, required this.startOver})
      : super(key: key);

  final int finalScore;
  final int round;
  final VoidCallback startOver;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StyleButton(
          icon: Icons.refresh,
          onPressed: () {
            startOver();
          },
        ),
        Padding(
            padding: const EdgeInsets.only(left: 32, right: 32
            ),
            child: Column(
              children: <Widget>[ Text("Score: ",style: LabelStyle.bodyText1(context),),
                Text(finalScore.toString(), style: ScoreNumberStyle.headline4(context),)],
            )),
        Padding(
            padding: const EdgeInsets.only(left: 32, right: 32
            ),
            child: Column(
              children: <Widget>[ Text("Round: ", style: LabelStyle.bodyText1(context),),
                Text(round.toString(),
                    style: ScoreNumberStyle.headline4(context))],
            )),
        StyleButton(
          icon: Icons.info,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AboutPage())
            );

          },
        )
      ],
    );
  }
}
