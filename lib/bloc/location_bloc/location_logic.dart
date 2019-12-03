import 'package:geolocator/geolocator.dart';

class AppLocation {
  static double latitude;
  static double longitude;
  static Position position;

  static double bearing;

  static String localName = '';
  static List<Placemark> placemark = List();

  static Future<void> getCurrentLocation() async {
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;

      //azimuth/bearing
      bearing = await Geolocator()
          .bearingBetween(latitude, longitude, 21.4225, 39.826167);

      //fetch local name
      placemark =
          await Geolocator().placemarkFromCoordinates(latitude, longitude);
      localName = placemark[0].locality;
    } catch (e) {
      print(e);
    }
  }
}
