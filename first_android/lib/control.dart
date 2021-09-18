import 'package:first_android/gamemodel.dart';
import 'package:first_android/sliderthumbimage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

class Control extends StatefulWidget {
  Control({Key? key, required this.model}) : super(key: key);
  final GameModel model;

  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
      late ui.Image _slideImage;
      Future<ui.Image> _load(String asset) async {

        ByteData data = await rootBundle.load(asset);
        ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
        ui.FrameInfo fi = await codec.getNextFrame();

        return fi.image;
}

@override
void initState() {
    
        _load("images/nub.png").then((value) {
          setState(() {
            _slideImage = value;
          });
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Padding(padding:  EdgeInsets.only(left: 90.0),
            child: Text("1",
              style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.redAccent,
                inactiveTickMarkColor: Colors.redAccent,
                trackHeight: 8.0,
                thumbColor: Colors.red,
                thumbShape: SliderThumbImage(_slideImage),
                overlayColor: Colors.red.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              ),
              child: Slider(
                  value: widget.model.current.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      widget.model.current = value.toInt();
                    });
                  },
                  min: 1.0,
                  max: 100.0),
            )),
        const Padding(padding: EdgeInsets.only(right: 64.0), child: Text("100",
            style: TextStyle(fontWeight: FontWeight.bold)))
      ],
    );
  }
}
