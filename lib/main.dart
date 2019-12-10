import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:where_is_mecca/bloc/location_bloc/location_bloc.dart';
import 'package:where_is_mecca/localization/localizations_delegate.dart';
import 'package:where_is_mecca/res/AppColors.dart';
import 'package:where_is_mecca/ui/compass_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider<LocationBloc>(
          builder: (context) =>
              LocationBloc(context)..add(LocationEvent.fetchLocation),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: AppColors.neutral,
            highlightColor: Colors.transparent,
            fontFamily: 'Ubuntu',
            textTheme: TextTheme(
                body1: TextStyle(
                  color: Colors.black54,
                ),
                title: TextStyle(
                  color: Colors.black54,
                )),
            primaryTextTheme:
                TextTheme(title: TextStyle(color: Colors.black54)),
            appBarTheme: AppBarTheme(elevation: 0, color: Colors.grey[50])),
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('es'),
          const Locale('ru'),
        ],
        home: CompassScreen(),
      ),
    ));
  });
}
