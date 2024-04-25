import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import 'package:sniper_pro/src/data/api/ApiConfig.dart';

import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/domain/models/video.dart';
import 'package:sniper_pro/src/presentation/Utils/ListToString.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class VideoServices {
  Future<String> token;
  VideoServices(this.token);

  Future<Resource<List<Video>>> getUser() async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/video');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Video> videos = Video.fromJsonList(data);
        return Success(videos);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
