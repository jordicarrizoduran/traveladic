// To parse this JSON data, do
//
//     final trips = tripsFromJson(jsonString);

import 'dart:convert';

List<Trips> tripsFromJson(String str) => List<Trips>.from(json.decode(str).map((x) => Trips.fromJson(x)));

String tripsToJson(List<Trips> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trips {
  String viatge;
  String pais;
  String id;
  String banner;
  String dates;
  String idioma;
  String hotel;
  List<Itinerari> itinerari;
  List<String> inclos;
  List<String> abansDeViatjar;
  List<String> essencialsMaleta;

  Trips({
    required this.viatge,
    required this.pais,
    required this.id,
    required this.banner,
    required this.dates,
    required this.idioma,
    required this.hotel,
    required this.itinerari,
    required this.inclos,
    required this.abansDeViatjar,
    required this.essencialsMaleta,
  });

  factory Trips.fromJson(Map<String, dynamic> json) => Trips(
    viatge: json["Viatge"],
    pais: json["País"],
    id: json["id"],
    banner: json["banner"],
    dates: json["Dates"],
    idioma: json["Idioma"],
    hotel: json["Hotel"],
    itinerari: List<Itinerari>.from(json["Itinerari"].map((x) => Itinerari.fromJson(x))),
    inclos: List<String>.from(json["Inclos"].map((x) => x)),
    abansDeViatjar: List<String>.from(json["Abans de viatjar"].map((x) => x)),
    essencialsMaleta: List<String>.from(json["Essencials Maleta"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Viatge": viatge,
    "País": pais,
    "id": id,
    "banner": banner,
    "Dates": dates,
    "Idioma": idioma,
    "Hotel": hotel,
    "Itinerari": List<dynamic>.from(itinerari.map((x) => x.toJson())),
    "Inclos": List<dynamic>.from(inclos.map((x) => x)),
    "Abans de viatjar": List<dynamic>.from(abansDeViatjar.map((x) => x)),
    "Essencials Maleta": List<dynamic>.from(essencialsMaleta.map((x) => x)),
  };
}

class Itinerari {
  String dia;
  String titol;
  String descripcio;

  Itinerari({
    required this.dia,
    required this.titol,
    required this.descripcio,
  });

  factory Itinerari.fromJson(Map<String, dynamic> json) => Itinerari(
    dia: json["dia"],
    titol: json["titol"],
    descripcio: json["descripcio"],
  );

  Map<String, dynamic> toJson() => {
    "dia": dia,
    "titol": titol,
    "descripcio": descripcio,
  };
}
