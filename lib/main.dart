import 'package:flutter/material.dart';
import 'package:thenextjoke/components/nextjoke_btn.dart';
import 'package:thenextjoke/components/pun_container.dart';
import 'package:thenextjoke/components/setup_container.dart';
import 'package:thenextjoke/components/share_btn.dart';
import 'package:thenextjoke/services/fetchColor.dart';
import 'package:thenextjoke/services/fetchJoke.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'dart:async';

import 'components/dotted_divider.dart';
import 'model/Joke.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<Joke> futureJoke;
  var _bgColor = '#FFFFFF';
  var _textColor = '#000000';
  var _index = 0;
  FetchColor colorInst = new FetchColor();

  final List<String> bgColorCode = <String>['#F4B41A', '#210070', '#FFE042', '#FFA781', '#00E189', '#000080', '#F2BC94', '#FFD55A', '#EFC9AF', '#F9858B'];
  final List<String> textColorCode = <String>['#143D59', '#4f86f7', '#E71989', '#5B0E2D', '#5E001F', '#F49F1C', '#722620', '#293250', '#104C91', '#761137'];

  void _setColor() async {
    await new Future.delayed(Duration(milliseconds: 500));
    setState(() {
      if(_index < 9){
        _index++;
        _bgColor = bgColorCode[_index];
        _textColor = textColorCode[_index];
        return 1;
      }
      else {
        _index = 0;
        _bgColor = bgColorCode[_index];
        _textColor = textColorCode[_index];
        return 1;
      }
    });
  }

  @override
  void initState(){
    super.initState();
    futureJoke = fetchJoke();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorInst.toColor(_bgColor),
        body: FutureBuilder<Joke>(
            future: futureJoke,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return ListView(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 8),
                  children: <Widget>[
                    SizedBox(height: 20),
                    Setup(setupText: snapshot.data.title, textColor: colorInst.toColor(_textColor),),
                    DottedDivider(textColor: colorInst.toColor(_textColor),),
                    Pun(punText: snapshot.data.pun, textColor: colorInst.toColor(_textColor),),
                    NextJokeBtn(joke: futureJoke,
                    bgColor: colorInst.toColor(_bgColor),
                    textColor: colorInst.toColor(_textColor),
                    onJokeChanged: () async {
                      setState(() {
                         futureJoke = fetchJoke();
                      });
                      _setColor();
                    },
                    ),
                    ShareButton(bgColor: colorInst.toColor(_bgColor),
                    textColor: colorInst.toColor(_textColor),
                    onShared: () async {
                      try {
                        Share.text('Title', snapshot.data.title+'\n'+snapshot.data.pun , 'text/plain');
                      } catch(e) {
                        print('error: $e');
                      }
                    },
                    )
                  ],
                );
              }
              else if(snapshot.hasError) {
                return Center(child: Text("${snapshot.hasError}"),);
              }
              return Center(child: CircularProgressIndicator(),);
            }
        ),
      ),
    );
  }
}
