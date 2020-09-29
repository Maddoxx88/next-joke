import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatefulWidget {
     var textColor;
  var index;
  ErrorScreen({Key key, this.textColor, this.index}) : super(key: key);
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text('Oh No!\nLooks like you\'re offline \nTry connecting to a network and restarting the app again.',
          style: GoogleFonts.scopeOne(
              textStyle: TextStyle(
                  color: widget.textColor,
                  fontSize: 48.0,
                  letterSpacing: 1.5
              )
          ),),
      ),
    );
  }
}
