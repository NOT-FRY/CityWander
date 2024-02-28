import 'dart:async';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


class ApiMappa {
  StreamController<LatLng> _locationStreamController = StreamController<LatLng>();

  // Metodo per ottenere lo stream di posizioni aggiornate
  Stream<LatLng> getCurrentLocationStream() {
    _checkPermissionAndGetCurrentLocation();
    return _locationStreamController.stream;
  }

  // Metodo privato per controllare il permesso e ottenere la posizione corrente
  Future<void> _checkPermissionAndGetCurrentLocation() async {
    PermissionStatus permissionStatus = await Permission.location.status;
    if (permissionStatus == PermissionStatus.granted) {
      await _getCurrentLocation();
    } else {
      PermissionStatus permissionResult = await Permission.location.request();
      if (permissionResult == PermissionStatus.granted) {
        await _getCurrentLocation();
      } else {
        _locationStreamController.addError('Permission denied');
      }
    }
  }

  // Metodo privato per ottenere la posizione corrente
  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final latLng = LatLng(position.latitude, position.longitude);
      _locationStreamController.add(latLng); // Emetti la nuova posizione nello stream
    } catch (e) {
      _locationStreamController.addError(e.toString()); // Emetti l'errore nello stream in caso di fallimento
    }
  }

  // Metodo per chiudere lo stream controller quando non è più necessario
  void dispose() {
    _locationStreamController.close();
  }
}
