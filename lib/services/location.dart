import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
 

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position.toString());
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (error) {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
    }
  }
}
