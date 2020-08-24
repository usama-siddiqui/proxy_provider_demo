import 'package:geolocator/geolocator.dart';

class GeoLocatorService {
  final geo = Geolocator();

  Future<Position> getCoords() async {
    return await geo.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  Future<List<Placemark>> getAddress(Position position) async {
    try {
      return await geo.placemarkFromCoordinates(
          position.latitude, position.longitude);
    } catch (PlatformException, error) {
      print(error.toString());
      return null;
    }
  }
}
