import 'package:sniper_pro/src/domain/models/Rol.dart';

class User {
  int? id;
  int? estado;
  int? descargo;
  String name;
  String lastname;
  String? email;
  String phone;
  String? password;
  String? notificationToken;
  String? imagen;

  List<Role>? roles;

  User({
    this.id,
    this.estado,
    this.descargo,
    required this.name,
    required this.lastname,
    this.email,
    required this.phone,
    this.password,
    this.notificationToken,
    this.imagen,
    this.roles,
  });
  static List<User> fromJsonList(List<dynamic> jsonList) {
    List<User> toList = [];
    jsonList.forEach((item) {
      User category = User.fromJson(item);
      toList.add(category);
    });
    return toList;
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        estado: json["estado"] ?? 0,
        descargo: json["descargo"] ?? 0,
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"] ?? '',
        notificationToken: json["notification_token"] ?? '',
        imagen: json["imagen"] ?? '',
        roles: json["roles"] != null
            ? List<Role>.from(json["roles"].map((x) => Role.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "estado": estado,
        "descargo": descargo,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "notification_token": notificationToken,
        "imagen": imagen,
        "password": password,
        "roles": roles != null
            ? List<dynamic>.from(roles!.map((x) => x.toJson()))
            : [],
      };
}
