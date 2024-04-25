class Video {
  int? id;

  String name;
  String description;
  String link;
  String? imagen;

  Video({
    this.id,
    this.imagen,
    required this.name,
    required this.description,
    required this.link,
  });
  static List<Video> fromJsonList(List<dynamic> jsonList) {
    List<Video> toList = [];
    jsonList.forEach((item) {
      Video video = Video.fromJson(item);
      toList.add(video);
    });
    return toList;
  }

  factory Video.fromJson(Map<String, dynamic> json) => Video(
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
