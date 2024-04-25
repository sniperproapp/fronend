import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';

class DeleteProductUseCase {
  ProductRepository productRepository;
  DeleteProductUseCase(this.productRepository);

  run(int id) => productRepository.delete(id);
}
