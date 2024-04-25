import 'dart:io';

import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

abstract class CategoryRepository {
  Future<Resource<Category>> create(Category category, File file);
  Future<Resource<Category>> update(int id, Category category, File? file);
  Future<Resource<bool>> delete(int id);

  Future<Resource<List<Category>>> getCategory();
}
