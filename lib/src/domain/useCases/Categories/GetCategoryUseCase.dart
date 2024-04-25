import 'package:sniper_pro/src/domain/Repository/CategoryRepository.dart';

class GetCategoryUseCase {
  CategoryRepository categoryRepository;
  GetCategoryUseCase(this.categoryRepository);

  run() => categoryRepository.getCategory();
}
