import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:sniper_pro/src/data/api/ApiConfig.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/domain/models/Ranking.dart';
import 'package:sniper_pro/src/domain/models/Report.dart';
import 'package:sniper_pro/src/presentation/Utils/ListToString.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

// segundo archivo que se verifica al tratar de traer la informacion
class ProductService {
  Future<String> token;
  ProductService(this.token);

  Future<Resource<List<Product>>> getCategory(
      int idcategory, String estado) async {
    try {
      Uri url =
          Uri.parse('${ApiConfig.API_ECOMMERCE}/products/category/$idcategory');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode({
        'estado': estado,
      });

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Product> product = Product.fromJsonList(data);
        return Success(product);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Product>> getproduct(int idproduct) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/products/$idproduct');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Product product = Product.fromJson(data);
        return Success(product);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<List<Report>>> getreport() async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/products/cout');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Report> report = Report.fromJsonListreport(data);
        return Success(report);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Ranking>>> getranking() async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/products/ranking');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Ranking> ranking = Ranking.fromJsonListranking(data);

        return Success(ranking);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<List<Product>>> getCategoryuser(
      int idcategory, int iduser) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/products/usercategory');
      String body = json.encode({'id_category': idcategory, 'id_user': iduser});
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Product> product = Product.fromJsonList(data);
        return Success(product);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Product>> create(Product product, List<File> files) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/products');

      final request = http.MultipartRequest('POST', url);
      final DateTime now = DateTime.now();

      request.headers['Authorization'] = await token;
      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = '*/*';

      files.forEach((file) async {
        request.files.add(http.MultipartFile('files[]',
            http.ByteStream(file.openRead().cast()), await file.length(),
            filename: basename(file.path),
            contentType: MediaType('file', 'jpg')));
      });

      request.fields['name'] = product.name;
      request.fields['image1'] = product.image1.toString();
      request.fields['price'] = product.price.toString();
      request.fields['price1'] = product.price1.toString();
      request.fields['price2'] = product.price2.toString();
      request.fields['sl'] = product.sl.toString();
      request.fields['tp1'] = product.tp1.toString();
      request.fields['tp2'] = product.tp2.toString();
      request.fields['tp3'] = product.tp3.toString();
      request.fields['tp4'] = product.tp4.toString();
      request.fields['tp5'] = product.tp5.toString();
      request.fields['compventa'] = product.compventa;
      request.fields['estad'] = product.estad.toString();
      request.fields['description'] = product.description;
      request.fields['id_category'] = product.idCategory.toString();
      request.fields['fecha'] = DateFormat().format(now).toString();

      request.fields['id_user'] = product.iduser.toString();
      request.fields['like'] = '0';

      final response = await request.send();
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productresponce = Product.fromJson(data);
        return Success(productresponce);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Product>> update(int id, Product product) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/products/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode({
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'price1': product.price1,
        'price2': product.price2,
        'tp1': product.tp1,
        'tp2': product.tp2,
        'tp3': product.tp3,
        'tp4': product.tp4,
        'tp5': product.tp5,
        'sl': product.sl,
        'estad': product.estad,
        'id_category': product.idCategory,
        'compventa': product.compventa
      });

      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productresponce = Product.fromJson(data);
        return Success(productresponce);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Product>> updateWithImage(int id, Product product,
      List<File> files, List<int> imagetoupdate) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/products/upload/$id');

      final request = http.MultipartRequest('PUT', url);

      request.headers['Authorization'] = await token;
      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = '*/*';

      files.forEach((file) async {
        request.files.add(http.MultipartFile('files[]',
            http.ByteStream(file.openRead().cast()), await file.length(),
            filename: basename(file.path),
            contentType: MediaType('file', 'jpg')));
      });

      request.fields['name'] = product.name;
      request.fields['price'] = product.price.toString();
      request.fields['description'] = product.description;
      request.fields['image_To_update'] = json.encode(imagetoupdate);

      request.fields['price1'] = product.price1.toString();
      request.fields['price2'] = product.price2.toString();
      request.fields['sl'] = product.sl.toString();
      request.fields['tp1'] = product.tp1.toString();
      request.fields['tp2'] = product.tp2.toString();
      request.fields['tp3'] = product.tp3.toString();
      request.fields['tp4'] = product.tp4.toString();
      request.fields['tp5'] = product.tp5.toString();
      request.fields['compventa'] = product.compventa;
      request.fields['estad'] = product.estad.toString();
      request.fields['description'] = product.description;
      request.fields['id_category'] = product.idCategory.toString();
      request.fields['id_user'] = product.iduser.toString();

      final response = await request.send();
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productresponce = Product.fromJson(data);
        return Success(productresponce);
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
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/products/$id');

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

  Future<Resource<bool>> activatetp(int id, int numero) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/products/activatetp');
      String body = json.encode({'id': id, 'numero': numero});
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<String>> like(int id, int numero) async {
    try {
      Uri url = Uri.parse('${ApiConfig.API_ECOMMERCE}/products/like/$id');
      String body = json.encode({'numero': numero});
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(data.toString());
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<List<Product>>> getCategorylike(
      int idcategory, String estado, int id) async {
    try {
      Uri url = Uri.parse(
          '${ApiConfig.API_ECOMMERCE}/products/category/like/$idcategory');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode({'estado': estado, 'id': id});

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Product> product = Product.fromJsonList(data);
        return Success(product);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
