import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/CategoriesUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListState.dart';

class AdminCategoryListBloc
    extends Bloc<AdminCategoryListEvent, AdminCategoryListState> {
  CategoriesUseCase categoriesUseCase;

  AdminCategoryListBloc(this.categoriesUseCase)
      : super(AdminCategoryListState()) {
    on<Getcategories>(_ongetCategories);
    on<DeleteCategory>(_onDeleteCategory);
  }

  Future<void> _ongetCategories(
      Getcategories event, Emitter<AdminCategoryListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await categoriesUseCase.getcategory.run();

    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteCategory(
      DeleteCategory event, Emitter<AdminCategoryListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await categoriesUseCase.delete.run(event.id);

    emit(state.copyWith(response: response));
  }
}
