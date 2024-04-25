import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';

class GetProductByCategoryUseCase {
  ProductRepository productRepository;
  GetProductByCategoryUseCase(this.productRepository);

  run(int idcategory, String estado) =>
      productRepository.getproductbyCategory(idcategory, estado);
}
