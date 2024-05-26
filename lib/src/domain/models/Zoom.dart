class Zoom {
  int? id;

  String name;
  String description;
  String link;
  String? imagen;

  Zoom({
    this.id,
    this.imagen,
    required this.name,
    required this.description,
    required this.link,
  });
  static List<Zoom> fromJsonList(List<dynamic> jsonList) {
    List<Zoom> toList = [];
    jsonList.forEach((item) {
      Zoom zoom = Zoom.fromJson(item);
      toList.add(zoom);
    });
    return toList;
  }

  factory Zoom.fromJson(Map<String, dynamic> json) => Zoom(
        id: json["id"] ?? 0,
        imagen: json["image"],
        name: json["name"],
        description: json["description"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": imagen,
        "link": link,
        "name": name,
        "description": description,
      };
}
