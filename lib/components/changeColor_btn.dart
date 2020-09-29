import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeColorBtn extends StatefulWidget {
  final VoidCallback onColorChanged;
  var bgColor;
  var textColor;

  ChangeColorBtn({this.onColorChanged, this.textColor, this.bgColor});
  @override
  _ChangeColorBtnState createState() => _ChangeColorBtnState();
}

class _ChangeColorBtnState extends State<ChangeColorBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: RaisedButton.icon(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)),
        padding: EdgeInsets.all(10),
        icon: Icon(Icons.color_lens, color: widget.bgColor),
        label: Text('Change Color',
          style: GoogleFonts.lora(
              textStyle: TextStyle(
                  color: widget.bgColor,
                  fontSize: 28.0,
                  letterSpacing: 1
              )
          ),),
        color: widget.textColor,
        onPressed: () => widget.onColorChanged()
      ),
    );
  }
}