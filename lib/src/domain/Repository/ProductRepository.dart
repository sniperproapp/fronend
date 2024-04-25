import 'dart:io';

import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/domain/models/Ranking.dart';
import 'package:sniper_pro/src/domain/models/Report.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

//este es el primer archivo que se verifica al crear un canal de comunicaciones
abstract class ProductRepository {
  Future<Resource<Product>> create(Product product, List<File> files);
  Future<Resource<List<Product>>> getproductbyCategory(
      int idcategory, String estado);

  Future<Resource<Product>> getproduct(int idproduct);
  Future<Resource<List<Product>>> getproductbyCategorylike(
      int idcategory, String estado, int id);
  // Future<Resource<int>> getproductbyCategorycount(int idcategory);

  Future<Resource<List<Report>>> getreport();
  Future<Resource<List<Ranking>>> getranking();
  Future<Resource<List<Product>>> getproductbyCategoryUser(
      int idcategory, int iduser);
  Future<Resource<Product>> update(
      int id, Product product, List<File>? files, List<int>? imagetoupdate);
  Future<Resource<bool>> delete(int id);
  Future<Resource<String>> like(int id, int numero);
  Future<Resource<bool>> activatetp(int id, int numero);
}
