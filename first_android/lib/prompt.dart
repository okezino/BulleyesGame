import 'package:flutter/material.dart';
import 'package:first_android/label.dart';

class Prompt extends StatelessWidget{

  Prompt({required this.targetValue});
  final int targetValue;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Text("Pull the Bulleye as clase as you can", style: LabelStyle.bodyText1(context), ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("$targetValue", style: TargetStyle.headline4(context),),
        )
      ],
    )
   ;
  }

}