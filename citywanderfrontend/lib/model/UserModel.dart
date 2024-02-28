// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? username;
    String? nome;
    String? cognome;
    String? email;
    String? password;
    String? lingua;
    String? ruolo;
    int? numeroGiorni;
    String? mezzoTrasporto;
    int? punti;
    DateTime? dataNascita;
    String? genere;
    String? telefono;
    String? partitaIva;
    String? viaAlloggio;
    String? coordinateAlloggio;
    bool? enabled;
    bool? accountNonExpired;
    bool? credentialsNonExpired;
    bool? accountNonLocked;
    List<Authority>? authorities;

    UserModel({
        this.username,
        this.nome,
        this.cognome,
        this.email,
        this.password,
        this.lingua,
        this.ruolo,
        this.numeroGiorni,
        this.mezzoTrasporto,
        this.punti,
        this.dataNascita,
        this.genere,
        this.telefono,
        this.partitaIva,
        this.viaAlloggio,
        this.coordinateAlloggio,
        this.enabled,
        this.accountNonExpired,
        this.credentialsNonExpired,
        this.accountNonLocked,
        this.authorities,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"] ?? '' , // per non far lanciare eccezione type 'Null' is not a subtype of type 'String
        nome: json["nome"] ?? '' ,
        cognome: json["cognome"]?? '' ,
        email: json["email"] ?? '' ,
        password: json["password"] ?? '' ,
        lingua: json["lingua"] ?? '',
        ruolo: json["ruolo"] ?? '',
        numeroGiorni: json["numeroGiorni"] ?? '',
        mezzoTrasporto: json["mezzoTrasporto"] ?? '',
        punti: json["punti"] ?? '' ,
        dataNascita: DateTime.tryParse(json["dataNascita"] ?? ''),//per non far lanciare eccezione Invalid date format
        genere: json["genere"] ?? '' ,
        telefono: json["telefono"] ?? '' ,
        partitaIva: json["partitaIva"] ?? '' ,
        viaAlloggio: json["viaAlloggio"] ?? '' ,
        coordinateAlloggio: json["coordinateAlloggio"] ?? '' ,
        enabled: json["enabled"],
        accountNonExpired: json["accountNonExpired"],
        credentialsNonExpired: json["credentialsNonExpired"],
        accountNonLocked: json["accountNonLocked"],
        authorities: List<Authority>.from(json["authorities"].map((x) => Authority.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "nome": nome,
        "cognome": cognome,
        "email": email,
        "password": password,
        "lingua": lingua,
        "ruolo": ruolo,
        "numeroGiorni": numeroGiorni,
        "mezzoTrasporto": mezzoTrasporto,
        "punti": punti,
        "dataNascita": "${dataNascita!.year.toString().padLeft(4, '0')}-${dataNascita!.month.toString().padLeft(2, '0')}-${dataNascita!.day.toString().padLeft(2, '0')}",
        "genere": genere,
        "telefono": telefono,
        "partitaIva": partitaIva,
        "viaAlloggio": viaAlloggio,
        "coordinateAlloggio": coordinateAlloggio,
        "enabled": enabled,
        "accountNonExpired": accountNonExpired,
        "credentialsNonExpired": credentialsNonExpired,
        "accountNonLocked": accountNonLocked,
        "authorities": List<dynamic>.from(authorities!.map((x) => x.toJson())),
    };
}

class Authority {
    String? authority;

    Authority({
        this.authority,
    });

    factory Authority.fromJson(Map<String, dynamic> json) => Authority(
        authority: json["authority"],
    );

    Map<String, dynamic> toJson() => {
        "authority": authority,
    };
}

