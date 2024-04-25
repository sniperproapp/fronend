import 'dart:io';

import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';

class UpdateProductUseCasa {
  ProductRepository productRepository;
  UpdateProductUseCasa(this.productRepository);

  run(int id, Product product, List<File>? files, List<int>? imagetoupdate) =>
      productRepository.update(id, product, files, imagetoupdate);
}
