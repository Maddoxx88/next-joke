import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShareButton extends StatefulWidget {
  final VoidCallback onShared;
  var bgColor;
  var textColor;
  ShareButton({this.onShared, this.textColor, this.bgColor});
  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: RaisedButton.icon(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
          padding: EdgeInsets.all(10),
          icon: Icon(Icons.share, color: widget.bgColor),
          label: Text('Share Joke',
            style: GoogleFonts.lora(
                textStyle: TextStyle(
                    color: widget.bgColor,
                    fontSize: 28.0,
                    letterSpacing: 1
                )
            ),),
          color: widget.textColor,
          onPressed: () => widget.onShared()
      ),
    );
  }
}
