import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import 'package:sniper_pro/src/data/api/ApiConfig.dart';

import 'package:sniper_pro/src/domain/models/Zoom.dart';

import 'package:sniper_pro/src/presentation/Utils/ListToString.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ZoomServices {
  Future<String> token;
  ZoomServices(this.token);

  Future<Resource<List<Zoom>>> getZoom() async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/zoom');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Zoom> zoom = Zoom.fromJsonList(data);
        return Success(zoom);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Zoom>> update(int id, Zoom zoom) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/zoom/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode({
        'name': zoom.name,
        'description': zoom.description,
        'link': zoom.link
      });

      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Zoom zoomresponce = Zoom.fromJson(data);
        return Success(zoomresponce);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Zoom>> updateimage(int id, Zoom zoom, File file) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/zoom/upload/$id');

      final request = http.MultipartRequest('PUT', url);

      request.headers['Authorization'] = await token;
      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = '*/*';

      request.files.add(http.MultipartFile(
          'file', http.ByteStream(file.openRead().cast()), await file.length(),
          filename: basename(file.path),
          contentType: MediaType('file', 'jpg')));
      request.fields['name'] = zoom.name;
      request.fields['link'] = zoom.link;
      request.fields['description'] = zoom.description;

      final response = await request.send();
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Zoom zoomresponce = Zoom.fromJson(data);
        return Success(zoomresponce);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
