import 'dart:convert';

List<TourModel> tourModelFromJson(String str) => List<TourModel>.from(json.decode(str).map((x) => TourModel.fromJson(x)));

String tourModelToJson(List<TourModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TourModel {
    int id;
    String stato;
    String username;
    int numeroGiorni;
    DateTime dataGenerazione;
    String foto;//Solo per interfaccia

    TourModel({
        required this.id,
        required this.stato,
        required this.username,
        required this.numeroGiorni,
        required this.dataGenerazione,
        required this.foto
    });

    factory TourModel.fromRawJson(String str) => TourModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TourModel.fromJson(Map<String, dynamic> json) => TourModel(
        id: json["id"],
        stato: json["stato"],
        username: json["username"],
        numeroGiorni: json["numeroGiorni"],
        dataGenerazione: DateTime.parse(json["dataGenerazione"]),
        foto: '/images/test.jpeg'
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "stato": stato,
        "username": username,
        "numeroGiorni": numeroGiorni,
        "dataGenerazione": "${dataGenerazione!.year.toString().padLeft(4, '0')}-${dataGenerazione!.month.toString().padLeft(2, '0')}-${dataGenerazione!.day.toString().padLeft(2, '0')}",
    };
}