import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:where_is_mecca/bloc/location_bloc/location_logic.dart';

import 'location_bloc_state.dart';

enum LocationEvent { fetchLocation }

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final BuildContext context;

  LocationBloc(this.context);

  @override
  LocationState get initialState => LocationStateInit();

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    switch (event) {
      case LocationEvent.fetchLocation:
        try {
          await AppLocation.getCurrentLocation();
          if (AppLocation.position != null) {
            print(
                'current location \n latitude: ${AppLocation.latitude}\n longitude: ${AppLocation.longitude}');
            yield LocationStateDefined(AppLocation.localName);
          } else
            yield LocationStateError();
          break;
        } catch (e) {
          print(e);
          yield LocationStateError();
          break;
        }
    }
  }
}
