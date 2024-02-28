import 'dart:convert';

List<RestaurantModel> restaurantModelListFromJson(String str) => List<RestaurantModel>.from(json.decode(str).map((x) => RestaurantModel.fromJson(x)));
RestaurantModel restaurantModelFromJson(String str) => RestaurantModel.fromJson(json.decode(str));

String restaurantModelListToJson(List<RestaurantModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
String restaurantModelToJson(RestaurantModel data) => json.encode(data.toJson());

class RestaurantModel {
    int? idRistorante;
    String? fkEsercente;
    String? nome;
    String? indirizzo;
    String? descrizione;
    String? descrizioneCompleta;//solo per UI: descrizione viene tagliata se troppo lunga
    int? punteggio;
    String? foto;
    String? coordinate;

    RestaurantModel({
        this.idRistorante,
        this.fkEsercente,
        this.nome,
        this.indirizzo,
        this.descrizione,
        this.descrizioneCompleta,
        this.punteggio,
        this.foto,
        this.coordinate
    });

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
        idRistorante: json["id_ristorante"],
        fkEsercente: json["fk_esercente"],
        nome: json["nome"],
        indirizzo: json["indirizzo"],
        descrizione: json["descrizione"],
        descrizioneCompleta: json["descrizione"],
        punteggio: json["punteggio"],
        foto: json["foto"],
        coordinate: json["coordinate"],
    );

    Map<String, dynamic> toJson() => {
        "id_ristorante": idRistorante,
        "fk_esercente": fkEsercente,
        "nome": nome,
        "indirizzo": indirizzo,
        "descrizione": descrizione,
        "punteggio": punteggio,
        "foto": foto,
        "coordinate": coordinate,
    };
}
