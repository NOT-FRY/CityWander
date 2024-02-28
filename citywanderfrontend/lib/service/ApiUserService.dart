import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myapp/model/UserModel.dart';
import 'package:myapp/model/ReponseModel.dart';
import 'package:myapp/ApiConstants.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/service/SecureStorageService.dart';
import 'dart:convert';

import 'package:myapp/utils.dart';

class ApiUserService{
    Future<UserModel?> findUserByEmail(String email) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.findUserByEmailEndpoint + "?email=" + email);
      // var response = await http.post(
      //   url,
      //   headers: HelperService.buildHeaders(), //Da inserire token come parametro
      //   body: jsonEncode(<String, String>{
      //     'email': email
      //   })
      // );

      //test get
      var response = await http.get(url);
      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);
        /*
          Codice per gestire gli errori
        */ 
        if(_responseModel.success && _responseModel.code == 200){
          UserModel _model = userModelFromJson(json.encode(_responseModel.data));
          return _model;
        }else{
          return null;
        }
      }
    } catch (e) {
      log(e.toString());    
    }
    return null;
  }

  Future<bool?> updateUserProfiling(int numeroGiorni, String viaAlloggio,String coordinateAlloggio) async {
    try {
      String? email = await SecureStorageService.storage.read(key: "EMAIL");
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.updateUserProfilingEndpoint}?email=$email&numeroGiorni=$numeroGiorni&viaAlloggio=$viaAlloggio&coordinateAlloggio=$coordinateAlloggio');

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

  Future<String?> geocoding(String viaAlloggio) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.geocodingEndpoint}?indirizzo=$viaAlloggio');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if(_responseModel.success && _responseModel.code == 200){
          return _responseModel.data.toString();
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