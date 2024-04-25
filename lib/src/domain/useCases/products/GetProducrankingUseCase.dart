import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';

class GetProducrankigUseCase {
  ProductRepository productRepository;
  GetProducrankigUseCase(this.productRepository);

  run() => productRepository.getranking();
}
