import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DottedDivider extends StatefulWidget {
  var textColor;
  var index;
  DottedDivider({Key key, @required this.textColor, this.index}) : super(key: key);
  @override
  _DottedDividerState createState() => _DottedDividerState();
}

class _DottedDividerState extends State<DottedDivider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(child: Text('. . . . .',
        style: GoogleFonts.lora(
            textStyle: TextStyle(
                color: widget.textColor,
                fontSize: 32.0,
                letterSpacing: 5
            )
        ),)),
    );
  }
}
