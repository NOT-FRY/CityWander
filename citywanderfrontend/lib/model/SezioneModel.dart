import 'dart:convert';

List<SezioneModel> sezioneModelFromJson(String str) => List<SezioneModel>.from(json.decode(str).map((x) => SezioneModel.fromJson(x)));

String sezioneModelToJson(List<SezioneModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SezioneModel {
    int? id;
    String descrizione;
    String foto;
    int? idTappa;
    String titolo;
    int? numero;
    

    SezioneModel({
        this.id,
        required this.descrizione,
        required this.foto,
        required this.idTappa,
        required this.titolo,
        required this.numero,
    });

    factory SezioneModel.fromJson(Map<String, dynamic> json) => SezioneModel(
        id: json["id"],
        descrizione: json["descrizione"],
        foto: json["foto"],
        idTappa: json["idTappa"],
        titolo: json["titolo"],
        numero: json["numero"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "descrizione": descrizione,
        "foto": foto,
        "idTappa": idTappa,
        "titolo": titolo,
        "numero": numero,
    };

    String getTitolo(){
      return titolo;
    }
}