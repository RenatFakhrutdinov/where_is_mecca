import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:where_is_mecca/bloc/location_bloc/location.dart';

enum LocationEvent { fetchLocation }

enum LocationState { locationInitialized, locationError, locationDefined }

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final BuildContext context;

  LocationBloc(this.context);

  @override
  LocationState get initialState => LocationState.locationInitialized;

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    switch (event) {
      case LocationEvent.fetchLocation:
        try {
          await AppLocation.getCurrentLocation();
          if (AppLocation.position != null) {
            print(
                'current location \n latitude: ${AppLocation.latitude}\n longitude: ${AppLocation.longitude}');
            yield LocationState.locationDefined;
          } else
            yield LocationState.locationError;
          break;
        } catch (e) {
          print(e);
          yield LocationState.locationError;
          break;
        }
    }
  }
}
