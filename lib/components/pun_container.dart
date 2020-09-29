import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pun extends StatefulWidget {
  final String punText;
  var textColor;
  var index;
  Pun({Key key, @required this.punText, this.textColor, this.index}) : super(key: key);
  @override
  _PunState createState() => _PunState();
}

class _PunState extends State<Pun> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      margin: EdgeInsets.all(10),
      child: Center(child: Text(widget.punText,
        style: GoogleFonts.lora(
            textStyle: TextStyle(
                color: widget.textColor,
                fontSize: 32.0,
                letterSpacing: 1.5
            )
        ),),),
    );
  }
}
