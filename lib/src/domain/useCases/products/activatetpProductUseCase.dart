import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';

class ActivatetpProductUseCase {
  ProductRepository productRepository;
  ActivatetpProductUseCase(this.productRepository);

  run(int id, int numero) => productRepository.activatetp(id, numero);
}
