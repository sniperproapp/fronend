import 'package:sniper_pro/src/domain/Repository/CategoryRepository.dart';

class DeleteCategoryUseCase {
  CategoryRepository categoryRepository;
  DeleteCategoryUseCase(this.categoryRepository);

  run(int id) => categoryRepository.delete(id);
}
