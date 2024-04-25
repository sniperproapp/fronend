import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';

class LikeProductUseCase {
  ProductRepository productRepository;
  LikeProductUseCase(this.productRepository);

  run(int id, int numero) => productRepository.like(id, numero);
}
