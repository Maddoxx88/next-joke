import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Setup extends StatefulWidget {
  final String setupText;
  var textColor;
  var index;
  Setup({Key key, @required this.setupText, this.textColor, this.index}) : super(key: key);
  @override
  _SetupState createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      margin: EdgeInsets.all(10),
      child: Center(child: Text(widget.setupText,
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
