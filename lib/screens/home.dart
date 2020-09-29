import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_joke_bloc/bloc/event/joke_event.dart';
import 'package:next_joke_bloc/bloc/fetchColor.dart';
import 'package:next_joke_bloc/bloc/joke_bloc.dart';
import 'package:next_joke_bloc/bloc/state/joke_state.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:next_joke_bloc/components/changeColor_btn.dart';
import 'package:next_joke_bloc/components/dotted_divider.dart';
import 'package:next_joke_bloc/components/nextjoke_btn.dart';
import 'package:next_joke_bloc/components/punchline.dart';
import 'package:next_joke_bloc/components/setup.dart';
import 'package:next_joke_bloc/components/share_btn.dart';
import 'package:next_joke_bloc/res/strings/strings.dart';
import 'package:next_joke_bloc/screens/error_screen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _bgColor = AppStrings.bgColor;
  var _textColor = AppStrings.textColor;
  List<String> _bgColorCode = AppStrings.bgColorCode;
  List<String> _textColorCode = AppStrings.textColorCode;
  var _index = 0;
 
  JokeBloc _jokeBloc;

  FetchColor colorInst = new FetchColor();

  @override
  void initState() {
    super.initState();
    _jokeBloc = BlocProvider.of<JokeBloc>(context);
    _jokeBloc.add(FetchJokeEvent());
  }

  @override
  Widget build(BuildContext context) { 
            return MaterialApp(
      home: Scaffold(
        backgroundColor: colorInst.toColor(_bgColor),
        body: Container(
          child: BlocBuilder<JokeBloc, JokeState>(
            builder: (_, state) {
              if (state is JokeInitialState) {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: colorInst.toColor(_bgColor),
                      size: 75.0,
                    )
                    );
              }
              else if (state is JokeLoadingState) {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: colorInst.toColor(_textColor),
                      size: 75.0,
                    )
                  );
              }
              else if (state is JokeLoadedState) {
                return ListView(
                      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 8),
                      children: <Widget>[
                       SizedBox(height: 20),
                    Setup(setupText: state.futureJoke.setup, textColor: colorInst.toColor(_textColor),),
                    DottedDivider(textColor: colorInst.toColor(_textColor),),
                    Punchline(punText: state.futureJoke.punchline, textColor: colorInst.toColor(_textColor),),
                    NextJokeBtn(
                    bgColor: colorInst.toColor(_bgColor),
                    textColor: colorInst.toColor(_textColor),
                    onJokeChanged: () async {
                      _jokeBloc.add(FetchJokeEvent());
                    },
                    ),
                    ChangeColorBtn(
                      bgColor: colorInst.toColor(_bgColor),
                      textColor: colorInst.toColor(_textColor),
                      onColorChanged: () async {
                        setColor();
                      },
                    ),
                    ShareButton(bgColor: colorInst.toColor(_bgColor),
                    textColor: colorInst.toColor(_textColor),
                    onShared: () async {
                      try {
                        Share.text('Title', state.futureJoke.setup+'\n'+state.futureJoke.punchline , 'text/plain');
                      } catch(e) {
                        print('error: $e');
                      }
                    },
                    )
                      ],
                    );
              } else if (state is JokeErrorState) {
                return ErrorScreen(textColor: colorInst.toColor(_textColor));
              }
            },
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

    void setColor () {
       setState(() {
         if(_index < 9){
        _index++;
        _bgColor = _bgColorCode[_index];
        _textColor = _textColorCode[_index];
      }
      else {
        _index = 0;
        _bgColor = _bgColorCode[_index];
        _textColor = _textColorCode[_index];
      }
       });
  }

}