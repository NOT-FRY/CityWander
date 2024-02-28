import 'package:myapp/model/TappaModel.dart';
import 'package:myapp/service/ApiTappaService.dart';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class ApiGeofencing {
  Position? _currentPosition;

  static int DISTANCE = 1800; //900 (punti) sono 100 metri per ogni direzione a partire dalla tappa, quindi il geofencing copre un area di 200 metri a lato quindi 900 = 40.000 m^2 = 0,04 km^2
                            //es. 9000 sarebbe 1km

  Future<void> checkPermissionAndGetCurrentLocation() async {
    PermissionStatus permissionStatus = await Permission.location.status;
    if (permissionStatus == PermissionStatus.granted) {
      await _getCurrentLocation();
    } else {
      PermissionStatus permissionResult = await Permission.location.request();
      if (permissionResult == PermissionStatus.granted) {
        await _getCurrentLocation();
      } else {
        _currentPosition = null;
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _currentPosition = position;
  }

  Future<String> checkNearestTappa(int id) async {
    await checkPermissionAndGetCurrentLocation();
    if(_currentPosition==null)
      return "null";
    String actualCoord="${_currentPosition!.latitude}, ${_currentPosition!.longitude}";
    print(actualCoord);
    String toReturn = "null";
    actualCoord = actualCoord.replaceAll('.', '');
    print(actualCoord);
    List<String> currentCoordinate = actualCoord.split(', ');
    ApiTappaService a = ApiTappaService();
    List<String> latitudini = [];
    List<String> longitudini = [];
    List<int?> ids = [];
    await ApiTappaService().getTappeNotComplete(id).then((List<TappaModel>? l) {
      if (l != null && l.isNotEmpty) {
        l.forEach((tappa) {
          List<String>? coordinateSplittate = a.getCoordinate(tappa)?.split(', ');
          if (coordinateSplittate != null && coordinateSplittate.length == 2) {
            latitudini.add(coordinateSplittate[0]);
            longitudini.add(coordinateSplittate[1]);
            print('Array di latitudini: $latitudini');
            print('Array di longitudini: $longitudini');
            ids.add(a.getId(tappa));
          }
        });
      }
      if (latitudini.isNotEmpty && longitudini.isNotEmpty) {
        int nearest = findNearestAttraction(
            currentCoordinate, latitudini, longitudini);
        if (nearest >= 0) {
          int? id = ids[nearest];
          toReturn ="$id";
        } else {
          print("Attrazioni troppo lontane");
        }
      }
    });
    return toReturn;
  }

  int findNearestAttraction(
      List<String> currentCoordinate, List<String> latitudini, List<String> longitudini) {
    print("Sono in findNearest");
    int n = latitudini.length;
    int nearestAttraction = -1;
    double minDistance = double.infinity;
    print("currentCoordinate: ${currentCoordinate[0]}");
    print("currentCoordinate: ${currentCoordinate[1]}");
    //controllo su lunghezza coordinate
    if(currentCoordinate[0].length<8)
      currentCoordinate[0] += "00000000";
    if(currentCoordinate[1].length<8)
      currentCoordinate[1] += "00000000";

    int latCurrent = int.parse(currentCoordinate[0].substring(0, 8));
    int lonCurrent = int.parse(currentCoordinate[1]. substring(0, 8));
    for (int i = 0; i < n; i++) {
      double distance =
          calculateDistance(latCurrent, lonCurrent, int.parse(latitudini[i]), int.parse(longitudini[i]));
      if (distance < minDistance) {
        minDistance = distance;
        nearestAttraction = i;
      }
    }
    print("nearest: $nearestAttraction");
    print("lat: ${latitudini[nearestAttraction]}, $latCurrent; lon: ${longitudini[nearestAttraction]}, $lonCurrent");
    if (sqrt(pow(int.parse(latitudini[nearestAttraction]) - latCurrent, 2)) <
            DISTANCE &&
        sqrt(pow(int.parse(longitudini[nearestAttraction]) - lonCurrent, 2)) <
            DISTANCE)
      return nearestAttraction;
    else
      return -1;
  }

  double calculateDistance(int x1, int y1, int x2, int y2) {
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  }
}
