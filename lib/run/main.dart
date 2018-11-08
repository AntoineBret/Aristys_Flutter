import 'package:aristys_app/database/repository.dart';
import 'package:aristys_app/redux/app_state.dart';
import 'package:aristys_app/src/colors.dart';
import 'package:aristys_app/src/cut_corners_border.dart';
import 'package:aristys_app/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:aristys_app/redux/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(new AristysApp());

class AristysApp extends StatelessWidget {
  final Store<AppState> store = new Store(readPostReducer, initialState: AppState.initState());

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store:store,
      child: new MaterialApp(
        title: 'Aristys app',
        theme: _kAristysTheme,
        routes: {
          '/': (BuildContext context) => new Home(),
        },
      ),
    );
  }
}

final ThemeData _kAristysTheme = _buildAristysTheme();

ThemeData _buildAristysTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kAristysAltDarkGrey,
    primaryColor: kAristysAltDarkGrey,
    buttonColor: kAristysBlue300,
    //Background color of layout
    scaffoldBackgroundColor: kAristysSurfaceWhite,
    //Background color of each card
    cardColor: kAristysSurfaceWhite,
    textSelectionColor: kAristysBlue100,
    errorColor: kAristysBlue100,
    //Text theme > details in _buildAristysTextTheme
    textTheme: _buildAristysTextTheme(base.textTheme),
    primaryTextTheme: _buildAristysTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildAristysTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(
      color: kAristysBlue100
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
    ),
  );
}

TextTheme _buildAristysTextTheme(TextTheme base){
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w400,
    ),
    title: base.title.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: 16.0,
    ),
    subtitle: base.subtitle.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: 14.0,
    ),
  ).apply(
    //Character font > get .ttf
  fontFamily: 'Rubik',
    //Text color
    displayColor: kAristysAltDarkGrey,
    bodyColor: kAristysAltDarkGrey,
  );
}


