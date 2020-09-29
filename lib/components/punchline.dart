import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Punchline extends StatefulWidget {
  final String punText;
  var textColor;
  var index;
  Punchline({Key key, @required this.punText, this.textColor, this.index}) : super(key: key);
  @override
  _PunchlineState createState() => _PunchlineState();
}

class _PunchlineState extends State<Punchline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Center(child: Text(widget.punText,
        style: GoogleFonts.quattrocentoSans(
            textStyle: TextStyle(
                color: widget.textColor,
                fontSize: 32.0,
                letterSpacing: 1.5
            )
        ),),),
    );
  }
}
