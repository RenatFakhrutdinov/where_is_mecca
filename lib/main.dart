import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:where_is_mecca/res/AppColors.dart';
import 'package:where_is_mecca/ui/compass_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      theme: ThemeData(
          primaryColor: AppColors.neutral,
          highlightColor: Colors.transparent,
          textTheme: TextTheme(
              body1: TextStyle(
                color: Colors.black54,
              ),
              title: TextStyle(
                color: Colors.black54,
              )),
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black54)),
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.grey[50])),
      home: CompassScreen(),
    ));
  });
}
