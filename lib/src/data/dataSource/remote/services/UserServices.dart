import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import 'package:sniper_pro/src/data/api/ApiConfig.dart';

import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/presentation/Utils/ListToString.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class UserServices {
  Future<String> token;
  UserServices(this.token);

  Future<Resource<List<User>>> getUser(String busqueda) async {
    try {
      if (busqueda == '') {
        busqueda = 'allusers';
      }

      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/users/$busqueda');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<User> users = User.fromJsonList(data);
        return Success(users);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<User>> update(int id, User user) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/users/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode(
          {'name': user.name, 'lastname': user.lastname, 'phone': user.phone});

      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        User userresponce = User.fromJson(data);
        return Success(userresponce);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<User>> updateimage(int id, User user, File image) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/users/update/$id');

      final request = http.MultipartRequest('PUT', url);

      request.headers['Authorization'] = await token;
      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = '*/*';

      request.files.add(http.MultipartFile('file',
          http.ByteStream(image.openRead().cast()), await image.length(),
          filename: basename(image.path),
          contentType: MediaType('image', 'jpg')));
      request.fields['name'] = user.name;
      request.fields['lastname'] = user.lastname;
      request.fields['phone'] = user.phone;

      final response = await request.send();
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);

      if (response.statusCode == 200 || response.statusCode == 201) {
        User userresponce = User.fromJson(data);
        return Success(userresponce);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<bool>> updateinactivate(int id) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/users/inactivate/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.put(url, headers: headers);
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

  Future<Resource<bool>> updateactivate(int id) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/users/activate/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.put(url, headers: headers);
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

  Future<Resource<bool>> updatedescargo(int id) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/users/descargo/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.put(url, headers: headers);
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

  Future<Resource<bool>> desactivateuserall() async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/users/desactivate/all');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.put(url, headers: headers);
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
