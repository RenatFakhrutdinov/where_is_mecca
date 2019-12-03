import 'package:equatable/equatable.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationStateInit extends LocationState {}

class LocationStateDefined extends LocationState {
  final String localName;

  LocationStateDefined(this.localName);
}

class LocationStateError extends LocationState {}
