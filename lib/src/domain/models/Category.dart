// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  int? id;
  String name;
  String description;
  String? image;
  int? notification;

  Category({
    this.id,
    required this.name,
    required this.description,
    this.image,
    this.notification,
  });

  // recibir una lista dinamica y transformarla a una lista de  categoria
  static List<Category> fromJsonList(List<dynamic> jsonList) {
    List<Category> toList = [];
    jsonList.forEach((item) {
      Category category = Category.fromJson(item);
      toList.add(category);
    });
    return toList;
  }

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      notification: json["notification"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "notification": notification,
      };
}
