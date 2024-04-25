import 'dart:io';

import 'package:sniper_pro/src/data/dataSource/remote/services/ProductService.dart';
import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/domain/models/Ranking.dart';
import 'package:sniper_pro/src/domain/models/Report.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductService productService;
  ProductRepositoryImp(this.productService);

  @override
  Future<Resource<Product>> create(Product product, List<File> files) {
    return productService.create(product, files);
  }

// esta es la tercera parte de la obtencion de informacion
  @override
  Future<Resource<List<Product>>> getproductbyCategory(
      int idcategory, String estado) {
    return productService.getCategory(idcategory, estado);
  }

  @override
  Future<Resource<List<Product>>> getproductbyCategorylike(
      int idcategory, String estado, int id) {
    return productService.getCategorylike(idcategory, estado, id);
  }

  @override
  Future<Resource<Product>> getproduct(int idproduct) {
    return productService.getproduct(idproduct);
  }

  @override
  Future<Resource<Product>> update(
      int id, Product product, List<File>? files, List<int>? imagetoupdate) {
    if (files != null && imagetoupdate != null) {
      return productService.updateWithImage(id, product, files, imagetoupdate);
    } else {
      return productService.update(id, product);
    }
  }

  @override
  Future<Resource<bool>> delete(int id) {
    return productService.delete(id);
  }

  @override
  Future<Resource<List<Product>>> getproductbyCategoryUser(
      int idcategory, int iduser) {
    return productService.getCategoryuser(idcategory, iduser);
  }

  @override
  Future<Resource<bool>> activatetp(int id, int numero) {
    return productService.activatetp(id, numero);
  }

  @override
  Future<Resource<String>> like(int id, int numero) {
    return productService.like(id, numero);
  }

  @override
  Future<Resource<List<Report>>> getreport() {
    return productService.getreport();
  }

  @override
  Future<Resource<List<Ranking>>> getranking() {
    return productService.getranking();
  }
}
