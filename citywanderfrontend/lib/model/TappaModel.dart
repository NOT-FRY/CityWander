import 'dart:convert';

List<TappaModel> tappaModelFromJson(String str) => List<TappaModel>.from(json.decode(str).map((x) => TappaModel.fromJson(x)));

String tappaModelToJson(List<TappaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TappaModel {
    int? id;
    String descrizione;
    String descrizioneCompleta;//solo per UI: descrizione viene tagliata se troppo lunga
    String nome;
    String coordinate;
    String foto;

    TappaModel({
        this.id,
        required this.descrizione,
        required this.descrizioneCompleta,
        required this.nome,
        required this.coordinate,
        required this.foto,
    });

    factory TappaModel.fromJson(Map<String, dynamic> json) => TappaModel(
        id: json["id"],
        descrizione: json["descrizione"],
        descrizioneCompleta: json["descrizione"],
        nome: json["nome"],
        coordinate: json["coordinate"],
        foto: json["foto"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "descrizione": descrizione,
        "nome": nome,
        "coordinate": coordinate,
        "foto": foto,
    };
}