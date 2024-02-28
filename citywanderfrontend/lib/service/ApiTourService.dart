import 'package:http/http.dart' as http;
import 'package:myapp/ApiConstants.dart';
import 'package:myapp/model/ReponseModel.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:myapp/model/TourModel.dart';

class ApiTourService {
  Future<List<TourModel>?> findTourByUsername(String username) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.findTourByUsernameEndpoint+"?username=" + username);

      var response = await http.get(url);
      if (response.statusCode == 200) {

        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if (_responseModel.success && _responseModel.code == 200) {
          
          List<TourModel> _model = tourModelFromJson(json.encode(_responseModel.data));

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

    Future<bool?> generateTour(String email) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.generateTourEndpoint+"?email=" + email);

      var response = await http.get(url);
      if (response.statusCode == 200) {

        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if (_responseModel.success && _responseModel.code == 200) {
          
          return true;

        } else {
          return false;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

    Future<bool?> updateTourState(int idTour, String nuovoStato) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.updateTourStateEndpoint}?idTour=$idTour&stato=$nuovoStato');

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

  Future<bool?> deleteTour(int idTour) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.deleteTourEndpoint}?id=$idTour');

      var response = await http.delete(url);
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