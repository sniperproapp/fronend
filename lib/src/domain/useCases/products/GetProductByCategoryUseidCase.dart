import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';

class GetProductByCategoryUseidCase {
  ProductRepository productRepository;
  GetProductByCategoryUseidCase(this.productRepository);

  run(int idcategory, int iduser) =>
      productRepository.getproductbyCategoryUser(idcategory, iduser);
}
