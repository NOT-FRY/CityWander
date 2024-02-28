import 'package:myapp/model/TappaModel.dart';
import 'package:myapp/model/SezioneModel.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/ApiConstants.dart';
import 'package:myapp/model/ReponseModel.dart';
import 'dart:convert';
import 'dart:developer';

class ApiTappaService {

  Future<List<TappaModel>?> getAllTappe() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.getAllTappeEndpoint);

      var response = await http.get(url);

      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if (_responseModel.success && _responseModel.code == 200) {

          List<TappaModel> _model = tappaModelFromJson(json.encode(_responseModel.data));

          return _model;
        } else {
          return null;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

    Future<List<TappaModel>?> findTappeByTourId(int tourId) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.findTappeByTourIdEndpoint+"?id=" + tourId.toString());

      var response = await http.get(url);

      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if (_responseModel.success && _responseModel.code == 200) {

          List<TappaModel> _model = tappaModelFromJson(json.encode(_responseModel.data));

          return _model;
        } else {
          return null;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<TappaModel>?> getTappeNotComplete(int tourId) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.getTappeNotCompleteEndpoint+"?id=" + tourId.toString());

      var response = await http.get(url);
      int resp=response.statusCode;
      print("Response $resp");
      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if (_responseModel.success && _responseModel.code == 200) {

          List<TappaModel> _model = tappaModelFromJson(json.encode(_responseModel.data));
          return _model;
        } else {
          return null;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  

  String getCoordinate(TappaModel t){
    return t.coordinate;
  }

  String getName(TappaModel t){
    return t.nome;
  }

  int? getId(TappaModel t){
    return t.id;
  }

  Future<TappaModel?> getTappaById(int id) async {
  try {
    // Ottieni tutte le tappe
    List<TappaModel>? tappe = await getAllTappe();
    
    // Se non ci sono tappe disponibili, restituisci null
    if (tappe == null) return null;

    // Cerca la tappa con l'id fornito
    for (var tappa in tappe) {
      if (tappa.id == id) {
        // Se trovi la tappa con l'id corrispondente, restituiscila
        return tappa;
      }
    }
    // Se non trovi nessuna tappa con l'id fornito, restituisci null
    return null;
  } catch (e) {
    log(e.toString());
    return null;
  }
 }

 Future<bool?> setTappaTourCompletata(int idTour, int idTappa) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.setTappaTourCompletataEndpoint}?idTour='+idTour.toString()+'&idTappa='+idTappa.toString());

      var response = await http.put(url);
      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if(_responseModel.success && _responseModel.code == 200){
          return _responseModel.data;
        }else{
          return null;
        }

      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<bool?> addPointsToUser(String email, int points) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.addPointsToUserEndpoint}?email=$email&pointsToAdd=$points');

      var response = await http.put(url);
      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if(_responseModel.success && _responseModel.code == 200){
          return _responseModel.data;
        }else{
          return null;
        }

      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

}
