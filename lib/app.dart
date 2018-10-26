import 'package:flutter/material.dart';
import 'home.dart';
import 'colors.dart';
import 'supplemental/cut_corners_border.dart';

class AristysApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aristys',
      home: HomePage(),
      initialRoute: '/home',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/home') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => HomePage(),
    );
  }
}

final ThemeData _kAristysTheme = _buildAristysTheme();

ThemeData _buildAristysTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    accentColor: kAristysBlue400,
    primaryColor: kAristysBlue100,
    buttonColor: kAristysBlue300,
    scaffoldBackgroundColor: kAristysBlue50,
    cardColor: kAristysBlue50,
    textSelectionColor: kAristysBlue50,
    errorColor: kAristysBlue50,
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
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily:'' ,
    displayColor: kAristysSurfaceWhite,
    bodyColor: kAristysSurfaceWhite,
  );
}