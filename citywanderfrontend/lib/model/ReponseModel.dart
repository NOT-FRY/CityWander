// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';
ResponseModel responseModelFromJson(var jsonBody) => ResponseModel.fromJson(jsonDecode(utf8.decode(jsonBody)));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
    bool success;
    int code;
    String description;
    var data;
    DateTime dateTime;

    ResponseModel({
        required this.success,
        required this.code,
        required this.description,
        required this.data,
        required this.dateTime,
    });

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        success: json["success"],
        code: json["code"],
        description: json["description"],
        data: json["data"],
        dateTime: DateTime.parse(json["dateTime"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "description": description,
        "data": data.toJson(),
        "dateTime": dateTime.toIso8601String(),
    };
}

