import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Future<Position> getLocation() async {
    return await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
