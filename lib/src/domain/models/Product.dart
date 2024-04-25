// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:sniper_pro/src/domain/models/User.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int? id;
  bool? tpactivate1;
  bool? tpactivate2;
  bool? tpactivate3;
  bool? tpactivate4;
  bool? tpactivate5;
  String name;
  String description;
  String? fecha;
  String compventa;
  String? image1;
  String? image2;
  double price;
  double? price1;
  double? price2;
  double? sl;
  double? tp1;
  double? tp2;
  double? tp3;
  double? tp4;
  double? tp5;
  int idCategory;
  int iduser;
  String? estad;
  String? createdat;
  User? user;

  int? like;

  Product({
    this.id,
    this.user,
    this.tpactivate1,
    this.tpactivate2,
    this.tpactivate3,
    this.tpactivate4,
    this.tpactivate5,
    this.estad,
    this.createdat,
    this.like,
    required this.name,
    required this.description,
    this.fecha,
    required this.compventa,
    this.image1,
    this.image2,
    required this.price,
    this.price1,
    this.price2,
    this.sl,
    this.tp1,
    this.tp2,
    this.tp3,
    this.tp4,
    this.tp5,
    required this.idCategory,
    required this.iduser,
  });

  static List<Product> fromJsonList(List<dynamic> jsonList) {
    List<Product> toList = [];
    jsonList.forEach((item) {
      Product product = Product.fromJson(item);
      toList.add(product);
    });
    return toList;
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        estad: json["estad"],
        user: json["user"] != null
            ? User.fromJson(json["user"])
            : User.fromJson({}),
        createdat: json["created_at"],
        like: json["like"] is String ? int.parse(json["like"]) : json["like"],
        tpactivate1: json["tpactivate1"] is String
            ? bool.parse(json["tpactivate1"])
            : json["tpactivate1"],
        tpactivate2: json["tpactivate2"] is String
            ? bool.parse(json["tpactivate2"])
            : json["tpactivate2"],
        tpactivate3: json["tpactivate3"] is String
            ? bool.parse(json["tpactivate3"])
            : json["tpactivate3"],
        tpactivate4: json["tpactivate4"] is String
            ? bool.parse(json["tpactivate4"])
            : json["tpactivate4"],
        tpactivate5: json["tpactivate5"] is String
            ? bool.parse(json["tpactivate5"])
            : json["tpactivate5"],
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        fecha: json["fecha"] ?? '',
        compventa: json["compventa"] ?? '',
        image1: json["image1"],
        image2: json["image2"],
        price: json["price"] is String
            ? double.parse(json["price"])
            : json["price"] is int
                ? (json["price"] as int).toDouble()
                : json["price"],
        price1: json["price1"] is String
            ? double.parse(json["price1"])
            : json["price1"] is int
                ? (json["price1"] as int).toDouble()
                : json["price1"],
        price2: json["price2"] is String
            ? double.parse(json["price2"])
            : json["price2"] is int
                ? (json["price2"] as int).toDouble()
                : json["price2"],
        sl: json["sl"] is String
            ? double.parse(json["sl"])
            : json["sl"] is int
                ? (json["sl"] as int).toDouble()
                : json["sl"],
        tp1: json["tp1"] is String
            ? double.parse(json["tp1"])
            : json["tp1"] is int
                ? (json["tp1"] as int).toDouble()
                : json["tp1"],
        tp2: json["tp2"] is String
            ? double.parse(json["tp2"])
            : json["tp2"] is int
                ? (json["tp2"] as int).toDouble()
                : json["tp2"],
        tp3: json["tp3"] is String
            ? double.parse(json["tp3"])
            : json["tp3"] is int
                ? (json["tp3"] as int).toDouble()
                : json["tp3"],
        tp4: json["tp4"] is String
            ? double.parse(json["tp4"])
            : json["tp4"] is int
                ? (json["tp4"] as int).toDouble()
                : json["tp4"],
        tp5: json["tp5"] is String
            ? double.parse(json["tp5"])
            : json["tp5"] is int
                ? (json["tp5"] as int).toDouble()
                : json["tp5"],
        idCategory: json["id_category"] is String
            ? int.parse(json["id_category"])
            : json["id_category"],
        iduser: json["id_user"] is String
            ? int.parse(json["id_user"])
            : json["id_user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "estad": estad,
        "created_at": createdat,
        "like": like,
        "name": name,
        "description": description,
        "fecha": fecha,
        "compventa": compventa,
        "image1": image1,
        "image2": image2,
        "price": price,
        "price1": price1,
        "price2": price2,
        "sl": sl,
        "tp1": tp1,
        "tp2": tp2,
        "tp3": tp3,
        "tp4": tp4,
        "tp5": tp5,
        "tpactivate1": tpactivate1,
        "tpactivate2": tpactivate2,
        "tpactivate3": tpactivate3,
        "tpactivate4": tpactivate4,
        "tpactivate5": tpactivate5,
        "id_category": idCategory,
        "id_user": iduser,
        "user": user != null ? user?.toJson() : []
      };
}
