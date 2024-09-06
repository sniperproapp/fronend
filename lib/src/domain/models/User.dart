import 'package:sniper_pro/src/domain/models/Rol.dart';

class User {
  int? id;
  int? estado;
  int? descargo;
  int? mensaje;
  String name;
  String lastname;
  String? email;
  String phone;
  String? password;
  String? notificationToken;
  String? imagen;
  String? time_limit;

  List<Role>? roles;

  User(
      {this.id,
      this.estado,
      this.descargo,
      this.mensaje,
      required this.name,
      required this.lastname,
      this.email,
      required this.phone,
      this.password,
      this.notificationToken,
      this.imagen,
      this.roles,
      this.time_limit});
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
        mensaje: json["mensaje"] ?? 0,
        name: json["name"],
        time_limit: json["time_limit"],
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
        "mensaje": mensaje,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "notification_token": notificationToken,
        "imagen": imagen,
        "password": password,
        "time_limit": time_limit,
        "roles": roles != null
            ? List<dynamic>.from(roles!.map((x) => x.toJson()))
            : [],
      };
}
