import 'package:flutter/material.dart';
import 'package:where_is_mecca/localization/app_localizations.dart';

class CompassScreen extends StatefulWidget {
  @override
  _CompassScreenState createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).title),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Where is Mecca?'),
      ),
    );
  }
}
