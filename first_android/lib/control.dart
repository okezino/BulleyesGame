import 'package:first_android/gamemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  Control({Key? key, required this.model}) : super(key: key);
  final GameModel model;

  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Padding(padding:  EdgeInsets.all(32.0), child: Text("1")),
        Expanded(
            child: Slider(
                value: widget.model.current.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    widget.model.current = value.toInt();
                  });
                },
                min: 1.0,
                max: 100.0)),
        const Padding(padding: EdgeInsets.all(32.0), child: Text("100"))
      ],
    );
  }
}
