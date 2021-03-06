import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors/sensors.dart';
import 'package:where_is_mecca/bloc/location_bloc/location_export.dart';
import 'package:where_is_mecca/bloc/location_bloc/location_logic.dart';
import 'package:where_is_mecca/localization/app_localizations.dart';
import 'package:where_is_mecca/res/quibla_icons.dart';

class CompassScreen extends StatefulWidget {
  @override
  _CompassScreenState createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  Geolocator _geolocator = Geolocator();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).title),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: _geolocator.isLocationServiceEnabled(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else
              return Visibility(
                visible: snapshot.data,
                child: BlocBuilder(
                    bloc: BlocProvider.of<LocationBloc>(context),
                    builder: (context, state) {
                      if (state is LocationStateInit) {
                        return Center(
                          child: CupertinoActivityIndicator(),
                        );
                      } else if (state is LocationStateDefined) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(200)),
                            Container(
                                height: ScreenUtil.getInstance().setHeight(600),
                                child: _compass()),
                            Container(
                              height: ScreenUtil.getInstance().setHeight(200),
                              child: Center(child: Text(AppLocation.localName)),
                            )
                          ],
                        );
                      } else
                        return Center(
                          child: Text(AppLocalizations.of(context).error),
                        );
                    }),
                replacement: Center(
                    child: Text(AppLocalizations.of(context).noLocation,
                        textAlign: TextAlign.center)),
              );
          }),
    );
  }

  Widget _compass() {
    return StreamBuilder(
        stream: accelerometerEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.z > 3 || snapshot.data.z < -3) {
              return StreamBuilder(
                  stream: FlutterCompass.events,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(AppLocalizations.of(context).error);
                    }
                    return Stack(
                      children: <Widget>[
                        Center(
                          child: Column(
                            children: <Widget>[
                              Transform.rotate(
                                angle: ((snapshot.data ?? 0) * (pi / 180) * -1),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(100)),
                                    SvgPicture.asset('images/compass.svg',
                                        height: ScreenUtil.getInstance()
                                            .setHeight(400)),
                                    SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(100)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Transform.rotate(
                            angle: (((snapshot.data ?? 0) -
                                    (AppLocation.bearing ?? 0)) *
                                (pi / 180) *
                                -1),
                            child: Column(children: <Widget>[
                              Icon(QiblaIcons.kaaba,
                                  color: Colors.black54,
                                  size:
                                      ScreenUtil.getInstance().setHeight(100)),
                              Icon(Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                  size:
                                      ScreenUtil.getInstance().setHeight(100)),
                              SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(400))
                            ]),
                          ),
                        ),
                      ],
                    );
                  });
            } else
              return Text(
                AppLocalizations.of(context).horizontal,
                textAlign: TextAlign.center,
              );
          } else
            return Center(
              child: CupertinoActivityIndicator(),
            );
        });
  }
}
