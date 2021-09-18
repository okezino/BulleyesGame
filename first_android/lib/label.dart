import 'package:flutter/material.dart';

class LabelStyle {
  static TextStyle bodyText1(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Colors.black,
        letterSpacing: 2);
  }
}
class ScoreNumberStyle {
  static TextStyle headline4(BuildContext context) {
    return Theme.of(context).textTheme.headline4!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Colors.black);
  }
}
class TargetStyle {
  static TextStyle headline4(BuildContext context) {
    return Theme.of(context).textTheme.headline4!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Colors.black);
  }
}

class StyleButton extends StatelessWidget{
  StyleButton({required this.icon, required this.onPressed});
  final IconData icon;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.black,
      splashColor: Colors.redAccent,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      shape: const CircleBorder(
        side: BorderSide(color: Colors.white)
      ),

    );
  }

}
class HitButton extends StatelessWidget{
 HitButton({required this.text, required this.onPressed});
  final String text;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.redAccent,
      splashColor: Colors.red[700],
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          text,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white)
      ),

    );
  }

}
