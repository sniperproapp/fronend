import 'package:sniper_pro/src/domain/Repository/ProductRepository.dart';

class GetProducreportUseCase {
  ProductRepository productRepository;
  GetProducreportUseCase(this.productRepository);

  run() => productRepository.getreport();
}
