import 'package:sniper_pro/src/domain/useCases/Categories/CreateCategoryUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/DeleteCategoryUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/GetCategoryUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/UpdateCategoryUseCase.dart';

class CategoriesUseCase {
  CreateCategoryUseCase create;
  UpdateCategoryUseCase update;
  GetCategoryUseCase getcategory;
  DeleteCategoryUseCase delete;

  CategoriesUseCase(
      {required this.delete,
      required this.create,
      required this.getcategory,
      required this.update});
}
