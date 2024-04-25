import 'dart:io';

import 'package:sniper_pro/src/domain/Repository/CategoryRepository.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';

class CreateCategoryUseCase {
  CategoryRepository categoryRepository;
  CreateCategoryUseCase(this.categoryRepository);

  run(Category category, File file) =>
      categoryRepository.create(category, file);
}
