import 'package:first_android/label.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
         appBar: AppBar(
           title: Text("About Bulleye Game", style: TargetStyle.headline4(context)),
           backgroundColor:Colors.white,
         ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "🎉 Bullseye 🎉",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                ),
              ),
            ),
            const Text(
              "This is Bullseye, the game where you can win points and earn fame by dragging a slider.\n",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            const Text(
              "Your goal is to place the slider as close as possible to the target value. The closer your are, the more points you score.\n",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            const Text(
              "Enjoy!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back!'),
              ),
            ),

          ],
        ),
      ),
    );
  }

}