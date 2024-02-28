import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:myapp/ApiConstants.dart';
import 'dart:developer';


class ApiImageRecognitionService{

  Future<String?> sendImageToServer(File imageFile) async {

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          ApiConstants.imageRecognitionUploadURL)
    );

    var lastSeparator = imageFile.path.lastIndexOf(Platform.pathSeparator);
    var filename = imageFile.path.substring(lastSeparator+1);

    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
        filename: filename,
      ),
    );

    try {
      var streamedResponse = await request.send();

      if (streamedResponse.statusCode == 200) {
        var response = await http.Response.fromStream(streamedResponse);
        var jsonResponse = jsonDecode(response.body);
        var imageUploaded = jsonResponse['filename'];
        return imageUploaded;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }


    Future<String?> imageRecognition(String fileName) async {
    try {
      var url = Uri.parse(ApiConstants.imageRecognitionURL+"?imageName=" + fileName);

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var recognizedImage = jsonResponse['recognizedImage'];
        return recognizedImage;
      }
      else 
        return null;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

}