import 'dart:io';

import 'package:sniper_pro/src/data/dataSource/remote/services/CategoryService.dart';
import 'package:sniper_pro/src/domain/Repository/CategoryRepository.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class CategoryRepositoryImp implements CategoryRepository {
  CategoryService categoryService;
  CategoryRepositoryImp(this.categoryService);

  @override
  Future<Resource<Category>> create(Category category, File file) {
    return categoryService.create(category, file);
  }

  @override
  Future<Resource<List<Category>>> getCategory() {
    return categoryService.getCategory();
  }

  @override
  Future<Resource<Category>> update(int id, Category category, File? file) {
    if (file == null) {
      return categoryService.update(id, category);
    } else {
      return categoryService.updateimage(id, category, file);
    }
  }

  @override
  Future<Resource<bool>> delete(int id) {
    return categoryService.delete(id);
  }
}
