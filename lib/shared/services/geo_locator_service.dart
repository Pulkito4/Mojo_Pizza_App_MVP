import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<Position> getLocation() async {
  //bool service enabled
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Loaction Permission Denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Loaction permission are permanently denied,we cannot request permission');
  }

  return await Geolocator.getCurrentPosition();
}

Future<String> getAddressFromLocation() async {
  try {
    // Get the current location using the existing function
    Position position = await getLocation();

    // Reverse geocode the coordinates to get the address
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      return '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';
    } else {
      return 'No address available';
    }
  } catch (e) {
    return 'Failed to get address: $e';
  }
}
