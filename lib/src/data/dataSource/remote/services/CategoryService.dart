import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:sniper_pro/src/data/api/ApiConfig.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/ListToString.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class CategoryService {
  Future<String> token;

  CategoryService(this.token);

  Future<Resource<Category>> create(Category category, File file) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/categories');

      final request = http.MultipartRequest('POST', url);

      request.headers['Authorization'] = await token;
      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = '*/*';

      request.files.add(http.MultipartFile(
          'file', http.ByteStream(file.openRead().cast()), await file.length(),
          filename: basename(file.path),
          contentType: MediaType('file', 'jpg')));
      request.fields['name'] = category.name;
      request.fields['description'] = category.description;

      final response = await request.send();
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Category categoriresponce = Category.fromJson(data);
        return Success(categoriresponce);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Category>>> getCategory() async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/categories');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Category> categories = Category.fromJsonList(data);
        return Success(categories);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Category>> updateimage(
      int id, Category category, File file) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/categories/upload/$id');

      final request = http.MultipartRequest('PUT', url);

      request.headers['Authorization'] = await token;
      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = '*/*';

      request.files.add(http.MultipartFile(
          'file', http.ByteStream(file.openRead().cast()), await file.length(),
          filename: basename(file.path),
          contentType: MediaType('file', 'jpg')));
      request.fields['name'] = category.name;
      request.fields['description'] = category.description;

      final response = await request.send();
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Category categoryresponce = Category.fromJson(data);
        return Success(categoryresponce);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Category>> update(int id, Category category) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/categories/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json
          .encode({'name': category.name, 'description': category.description});

      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Category categoryresponce = Category.fromJson(data);
        return Success(categoryresponce);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<bool>> delete(int id) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/categories/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.delete(url, headers: headers);
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
