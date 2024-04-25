import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';

class GetProductUseCase {
  ProductRepository productRepository;
  GetProductUseCase(this.productRepository);

  run(int idproduct) => productRepository.getproduct(idproduct);
}
