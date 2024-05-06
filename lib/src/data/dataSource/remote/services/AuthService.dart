import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sniper_pro/src/data/api/ApiConfig.dart';
import 'package:sniper_pro/src/data/dataSource/local/SharedPref.dart';
import 'package:sniper_pro/src/presentation/Utils/ListToString.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/RecuperarpassPage.dart';

class AuthService {
  SharedPref sharedPref;
  AuthService(this.sharedPref);
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      var tokemessage = await sharedPref.read('token');
      if (tokemessage == null) {
        print(tokemessage);
        tokemessage = '';
      }
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/auth/login');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json
          .encode({'email': email, 'password': password, 'token': tokemessage});

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        print(data);
        return Success(authResponse);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<AuthResponse>> loginid(int id) async {
    try {
      var tokemessage = await sharedPref.read('token');
      if (tokemessage == null) {
        print(tokemessage);
        tokemessage = '';
      }
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/auth/loginid');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode({'id': id, 'token': tokemessage});

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        print(data);
        return Success(authResponse);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<bool> logout() async {
    try {
      String email = '';
      final usersession = await sharedPref.read('user');
      if (usersession != null) {
        AuthResponse authResponse = AuthResponse.fromJson(usersession);
        email = authResponse.user.email.toString();
      }

      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/auth/logout/$email');
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await http.post(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<Resource<AuthResponse>> register(User user) async {
    try {
      final tokemessage = await sharedPref.read('token');
      if (tokemessage != null) {
        user.notificationToken = tokemessage;
        print(tokemessage);
      }

      user.estado = 0;
      user.mensaje = 0;
      user.imagen =
          'https://firebasestorage.googleapis.com/v0/b/sniperpro-a9151.appspot.com/o/user_image.png?alt=media&token=54be3aec-fa14-419a-8f1a-c5f350ed7531';
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/auth/register');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode(user.toJson());

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<bool>> recuperarpass(String email) async {
    try {
      Uri url =
          Uri.parse('${ApiConfig.API_ECOMMERCE}/auth/recuperarpass/$email');
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await http.post(url, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
