import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:where_is_mecca/bloc/location_bloc/location.dart';
import 'package:where_is_mecca/localization/app_localizations.dart';

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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: ScreenUtil.getInstance().setHeight(200)),
                    Container(
                        height: ScreenUtil.getInstance().setHeight(600),
                        child: _compass()),
                    Container(
                      height: ScreenUtil.getInstance().setHeight(200),
                      child: Center(child: Text(AppLocation.localName)),
                    )
                  ],
                ),
                replacement: Center(
                    child: Text(AppLocalizations.of(context).noLocation,
                        textAlign: TextAlign.center)),
              );
          }),
    );
  }

  Widget _compass() {
    return Center(
      child: SvgPicture.asset('images/compass.svg'),
    );
  }
}
