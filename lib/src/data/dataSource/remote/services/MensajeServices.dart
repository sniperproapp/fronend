import 'dart:convert';
 import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sniper_pro/src/data/api/ApiConfig.dart';
 import 'package:sniper_pro/src/presentation/Utils/ListToString.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class MensajeServices {
  Future<String> token;
  MensajeServices(this.token);

   
  Future<Resource<bool>> post(String titulo, String description) async {


    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/mensaje');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode({
        'titulo': titulo,
        'description': description
         
      });

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        bool respueta = data as bool;
   
        return Success(respueta);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  
}
