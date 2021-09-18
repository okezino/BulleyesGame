import 'package:flutter/material.dart';

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
        FlatButton(
          child: const Text("Start Over"),
          onPressed: () {
            startOver();
          },
        ),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[const Text("Score: "), Text(finalScore.toString())],
            )),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[const Text("Round: "), Text(round.toString())],
            )),
        FlatButton(
          child: const Text("Press Again"),
          onPressed: () {},
        )
      ],
    );
  }
}
