import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'package:myapp/ApiConstants.dart';
import 'package:myapp/model/LoginModel.dart';
import 'package:myapp/model/ReponseModel.dart';
import 'package:intl/intl.dart';
import 'package:myapp/model/UserModel.dart';
import 'package:myapp/service/ApiUserService.dart';
import 'package:myapp/service/SecureStorageService.dart';
import 'package:myapp/utils.dart';

class ApiAuthService {

  Future<LoginModel?> login(String email,String password) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint);
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'email': email,
          'password' : password
        })
      );
      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);
        /*
          Codice per gestire gli errori
        */ 
        if(_responseModel.success && _responseModel.code == 200){
          LoginModel _model = loginModelFromJson(json.encode(_responseModel.data));

          SecureStorageService.storage.write(key: "jwt", value: _model.token.toString());
          SecureStorageService.storage.write(key: "EMAIL",value: email);
          await ApiUserService().findUserByEmail(email).then((user){
            SecureStorageService.storage.write(key: "ROLE",value: user!.ruolo);
            SecureStorageService.storage.write(key: "USERNAME",value: user.username);
          }); 

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

  
  Future<LoginModel?> register(String nome,String cognome,String username,String email,String password,String lingua,String genere,String telefono,DateTime dataNascita) async {
    try {


    String formattedDate = DateFormat('yyyy-MM-dd').format(dataNascita);

      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registerEndpoint);
      var response = await http.post(
        url,
        headers: HelperService.buildHeaders(),
        body: jsonEncode({
          'nome': nome,
          'cognome' : cognome,
          'username' : username,
          'email': email,
          'password' : password,
          'lingua' : lingua,
          'genere' : genere,
          'telefono': telefono,
          'dataNascita' : formattedDate,
        })
      );
      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);
        /*
          Codice per gestire gli errori
        */ 
        if(_responseModel.success && _responseModel.code == 200){
          LoginModel _model = loginModelFromJson(json.encode(_responseModel.data));
          SecureStorageService.storage.write(key: "jwt", value: _model.token.toString());
          SecureStorageService.storage.write(key: "EMAIL",value: email);
          SecureStorageService.storage.write(key: "USERNAME",value: username);
          SecureStorageService.storage.write(key: "ROLE",value: "TURISTA");
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

  Future<LoginModel?> registerEsercente(String nome,String cognome,String username,String email,String password,String lingua,String telefono,DateTime dataNascita,String partitaIva) async {
    
    String formattedDate = DateFormat('yyyy-MM-dd').format(dataNascita);
    
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registerEsercenteEndpoint);
      var response = await http.post(
        url,
        headers: HelperService.buildHeaders(),
        body: jsonEncode({
          'nome': nome,
          'cognome' : cognome,
          'username' : username,
          'email': email,
          'password' : password,
          'lingua' : lingua,
          'telefono': telefono,
          'dataNascita' : formattedDate,
          'partitaIva' : partitaIva
        })
      );
      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);
        /*
          Codice per gestire gli errori
        */ 
        if(_responseModel.success && _responseModel.code == 200){
          LoginModel _model = loginModelFromJson(json.encode(_responseModel.data));
          SecureStorageService.storage.write(key: "jwt", value: _model.token.toString());
          SecureStorageService.storage.write(key: "EMAIL",value: email);
          SecureStorageService.storage.write(key: "USERNAME",value: username);
          SecureStorageService.storage.write(key: "ROLE",value: "ESERCENTE");
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

  static Future<void> logout() async {
    await SecureStorageService.storage.deleteAll();
  }

  Future<bool> isServerAvailable() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url).timeout(const Duration (seconds: 10));
      if (response.statusCode == 200) {
        return true;
      }else{
        return false;
      }
    } catch (e) {
      developer.log(e.toString());    
    }
    return false;
  }

  Future<bool> checkEmailExists(String email) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.isEmailTakenEndpoint + "?email="+email);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);
        if(_responseModel.success && _responseModel.code == 200){
          if(_responseModel.data == false){
            return false;
          }
        }
      }
    } catch (e) {
      developer.log(e.toString());    
    }
    return true; //Restituisce che la mail esiste all'interno del DB anche se su errore
  }

  Future<bool> checkUsernameExists(String username) async {
    try {
     var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.isUsernameTakenEndpoint + "?username="+username);
     var response = await http.get(url);

      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);
        if(_responseModel.success && _responseModel.code == 200){
          if(_responseModel.data == false){
            return false;
          }
        }  
      }
    } catch (e) {
      developer.log(e.toString());    
    }
    return true;//Restituisce che la mail esiste all'interno del DB anche se su errore
  }
  

}
