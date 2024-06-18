class Ranking {
  String? nombre;
  int? ganadas;
  int? perdidas;
  double? puntosganadas;
  double? puntosperdidas;

  int? total;
  String? imagen;

  Ranking({
    this.imagen,
    this.nombre,
    this.ganadas,
    this.puntosganadas,
    this.puntosperdidas,
    this.perdidas,
    this.total,
  });
  static List<Ranking> fromJsonListranking(List<dynamic> jsonList) {
    List<Ranking> toList = [];
    jsonList.forEach((item) {
      Ranking ranking = Ranking.fromJson(item);
      toList.add(ranking);
    });
    return toList;
  }

  factory Ranking.fromJson(Map<String, dynamic> json) => Ranking(
      imagen: json["imagen"],
      nombre: json["nombre"],
      ganadas: json["ganadas"],
      perdidas: json["perdidas"],
      puntosganadas: json["puntosganadas"] is String
          ? double.parse(json["puntosganadas"])
          : json["puntosganadas"] is int
              ? (json["puntosganadas"] as int).toDouble()
              : json["puntosganadas"],
      puntosperdidas: json["puntosperdidas"] is String
          ? double.parse(json["puntosperdidas"])
          : json["puntosperdidas"] is int
              ? (json["puntosperdidas"] as int).toDouble()
              : json["puntosperdidas"],
      total: json["total"]);

  Map<String, dynamic> toJson() => {
        "imagen": imagen,
        "total": total,
        "nombre": nombre,
        "ganadas": ganadas,
        "perdidas": perdidas,
        "puntosganadas": puntosganadas,
        "puntosperdidas": puntosperdidas,
      };
}
