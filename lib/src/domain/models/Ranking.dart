class Ranking {
  String? nombre;
  int? ganadas;
  int? total;
  String? imagen;

  Ranking({
    this.imagen,
    this.nombre,
    this.ganadas,
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
      total: json["total"]);

  Map<String, dynamic> toJson() => {
        "imagen": imagen,
        "total": total,
        "nombre": nombre,
        "ganadas": ganadas,
      };
}
