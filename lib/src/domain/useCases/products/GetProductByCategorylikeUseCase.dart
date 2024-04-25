import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';

class GetProductByCategorylikeUseCase {
  ProductRepository productRepository;
  GetProductByCategorylikeUseCase(this.productRepository);

  run(int idcategory, String estado, int id) =>
      productRepository.getproductbyCategorylike(idcategory, estado, id);
}
