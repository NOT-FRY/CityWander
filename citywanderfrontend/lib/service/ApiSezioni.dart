import 'package:myapp/model/TappaModel.dart';
import 'package:myapp/model/SezioneModel.dart';
import 'package:myapp/service/ApiTappaService.dart';
import 'package:myapp/ApiConstants.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/model/ReponseModel.dart';
import 'dart:math';
import 'dart:convert';
import 'dart:developer';

class ApiSezioni {
  final ApiTappaService apiService = ApiTappaService();
  TappaModel? tappamod;
  List<SezioneModel>? sezioni;
  List<String>? titoli; 


  Future<List<SezioneModel>?> findSezioniByTappaId(int tappaId) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.findSezioniByTappaIdEndpoint+"?id=" + tappaId.toString());

      var response = await http.get(url);
      int resp=response.statusCode;
      if (response.statusCode == 200) {
        ResponseModel _responseModel = responseModelFromJson(response.bodyBytes);

        if (_responseModel.success && _responseModel.code == 200) {

          List<SezioneModel> _model = sezioneModelFromJson(json.encode(_responseModel.data));
          return _model;
        } else {
          return null;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<SezioneModel?> getSection(int idTappa, int num) async {
  try {
    List<SezioneModel>? sections = await findSezioniByTappaId(idTappa);
    if (sections == null) return null;
    for (var sezione in sections) {
      if (sezione.numero == num) {
        return sezione;
      }
    }
    return null;
  } catch (e) {
    print(e.toString());
    return null;
  }
}
  
  Future <int?> getNumSez(int idTappa) async{
    try {
    List<SezioneModel>? sections = await findSezioniByTappaId(idTappa);
    if (sections == null) return 0;
    else return sections.length;
  } catch (e) {
    print(e.toString());
    return null;
  }
  }
}
