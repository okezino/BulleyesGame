import 'package:first_android/label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:first_android/score.dart';
import 'package:first_android/control.dart';
import 'package:first_android/gamemodel.dart';
import 'package:first_android/prompt.dart';
import 'dart:math';
import 'package:first_android/about.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //This is the code
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GamePage(title: 'Game Home Page'),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<GamePage> {
  bool _alertVisibility = false;
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(Random().nextInt(100) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,image:DecorationImage(image: AssetImage("images/bg.png"),
      fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:48,bottom: 32),
                child: Prompt(targetValue: _model.target),
              ),
              Control(model: _model),
              Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: HitButton(
                  text: "Hit Me!!",
                  onPressed: () {
                    _showAlert(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Score(finalScore: _model.totalScore, round: _model.round, startOver: _startOver),
              )
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }


  _startOver(){
    setState(() {
      _model.totalScore = GameModel.SCORE_START;
      _model.target = Random().nextInt(100) + 1;
      _model.round = GameModel.ROUND_START;
      _model.current = GameModel.SLIDER_START;
    });
  }

  _alertTitle() {
    int diff = _getUpdatedDiff();
    if (diff == 0) {
      return "Perfect";
    } else if (diff < 5) {
      return "You Almost had it";
    } else if (diff < 10) {
      return "Not bad ";
    } else {
      return "poor";
    }
  }

  int _getUpdatedDiff() => (_model.target - _getCurrentstate()).abs();

  int _getCurrentstate() => _model.current;

  int _getPointForCurrentRound() {
    int maxPoint = 100;
    int diff = _getUpdatedDiff();

    if (diff == 0) {
      return 200;
    } else if (diff == 1) {
      return 149;
    } else {
      return maxPoint - diff;
    }
  }

  void _showAlert(BuildContext context) {
    Widget Okbutton = StyleButton(
        icon: Icons.close,
        onPressed: () {
          Navigator.of(context).pop();
          _alertVisibility = !_alertVisibility;
          setState(() {
            _model.totalScore += _getPointForCurrentRound();
            _model.round += 1;
            _model.target = Random().nextInt(100) + 1;
          });
        });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(_alertTitle(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),),
            content:Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[ Text("THE SLIDER VALUE IS", textAlign: TextAlign.center ),
                Text("this ${_getCurrentstate()}",
                    textAlign: TextAlign.center,
                style: TargetStyle.headline4(context),),
                Text("Your Score ${_getPointForCurrentRound()} points this Round",
                    textAlign: TextAlign.center )

              ],
            ) ,
            actions: <Widget>[Okbutton],
            elevation: 5,
          );
        });
  }
}
// Text("This is my slide point ${_getCurrentstate()} \n" +
// "Your Score ${_getPointForCurrentRound()}")
