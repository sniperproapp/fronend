import 'dart:io';

import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';

class CreateProductUseCase {
  ProductRepository productRepository;
  CreateProductUseCase(this.productRepository);
  run(Product product, List<File> files) =>
      productRepository.create(product, files);
}
