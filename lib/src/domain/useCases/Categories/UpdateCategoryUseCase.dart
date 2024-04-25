import 'dart:io';

import 'package:sniper_pro/src/domain/Repository/CategoryRepository.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';

class UpdateCategoryUseCase {
  CategoryRepository categoryRepository;
  UpdateCategoryUseCase(this.categoryRepository);

  run(int id, Category category, File? file) =>
      categoryRepository.update(id, category, file);
}
