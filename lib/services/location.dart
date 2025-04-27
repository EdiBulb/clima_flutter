import 'package:geolocator/geolocator.dart';

class Location {

  Location({this.latitude, this.longitude});
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    // Try catch
    try {
      // somethingThatExpectsLessThan10(12);
      Position position = await Geolocator.getCurrentPosition();
      print(position);

      latitude = position.latitude;
      longitude = position.longitude;

    } catch (e) {
      print(e);
    }
  }
}
