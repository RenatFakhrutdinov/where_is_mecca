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
      ),
      home: CompassScreen(),
    ));
  });
}
