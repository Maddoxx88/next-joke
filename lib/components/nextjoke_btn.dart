import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_joke_bloc/bloc/joke_bloc.dart';


class NextJokeBtn extends StatefulWidget {
  final VoidCallback onJokeChanged;
  var bgColor;
  var textColor;

  NextJokeBtn({this.onJokeChanged, this.textColor, this.bgColor});

  @override
  _NextJokeBtnState createState() => _NextJokeBtnState();
}

class _NextJokeBtnState extends State<NextJokeBtn> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: RaisedButton.icon(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)),
        padding: EdgeInsets.all(10),
        icon: Icon(Icons.sync, color: widget.bgColor),
        label: Text('Next Joke',
          style: GoogleFonts.lora(
              textStyle: TextStyle(
                  color: widget.bgColor,
                  fontSize: 28.0,
                  letterSpacing: 1
              )
          ),),
        color: widget.textColor,
        onPressed: () => widget.onJokeChanged()
      ),
    );
  }
}
