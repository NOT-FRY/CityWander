import 'package:myapp/model/RestaurantModel.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/ApiConstants.dart';
import 'package:myapp/model/ReponseModel.dart';
import 'dart:convert';
import 'dart:developer';

class ApiRestaurantService {
  Future<List<RestaurantModel>?> findTopRistoranti(int limite) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.findTopRistorantiEndpoint+"?limite=" + limite.toString());

      var response = await http.get(url);
      if (response.statusCode == 200) {

        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if (_responseModel.success && _responseModel.code == 200) {
          
          List<RestaurantModel> _model = restaurantModelListFromJson(json.encode(_responseModel.data));

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

  Future<RestaurantModel?> findRistoranteByName(String name) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.findRistoranteByNameEndpoint+"?nome=" + name);

      var response = await http.get(url);
      if (response.statusCode == 200) {

        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if (_responseModel.success && _responseModel.code == 200) {
          
          RestaurantModel _model = restaurantModelFromJson(json.encode(_responseModel.data));

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

  Future<List<RestaurantModel>?> findRistorantiByUsername(String username) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.findRistoranteByUsernameEndpoint+"?username=" + username);

      var response = await http.get(url);
      if (response.statusCode == 200) {

        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if (_responseModel.success && _responseModel.code == 200) {
          
          List<RestaurantModel> _model = restaurantModelListFromJson(json.encode(_responseModel.data));

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
}