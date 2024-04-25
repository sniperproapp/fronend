import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/CategoriesUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/list/bloc/ProfCategoryListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/list/bloc/ProfCategoryListState.dart';

class ProfCategoryListBloc
    extends Bloc<ProfCategoryListEvent, ProfCategoryListState> {
  CategoriesUseCase categoriesUseCase;

  ProfCategoryListBloc(this.categoriesUseCase)
      : super(ProfCategoryListState()) {
    on<Getcategories>(_ongetCategories);
    on<DeleteCategory>(_onDeleteCategory);
  }

  Future<void> _ongetCategories(
      Getcategories event, Emitter<ProfCategoryListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await categoriesUseCase.getcategory.run();

    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteCategory(
      DeleteCategory event, Emitter<ProfCategoryListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await categoriesUseCase.delete.run(event.id);

    emit(state.copyWith(response: response));
  }
}
