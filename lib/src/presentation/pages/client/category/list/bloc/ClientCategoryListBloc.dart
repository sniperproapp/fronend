import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/CategoriesUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/category/list/bloc/ClientCategoryListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/category/list/bloc/ClientCategoryListState.dart';

class ClientCategoryListBloc
    extends Bloc<ClientCategoryListEvent, ClientCategoryListState> {
  CategoriesUseCase categoriesUseCase;
  AuthUseCases authUseCases;

  ClientCategoryListBloc(this.categoriesUseCase, this.authUseCases)
      : super(ClientCategoryListState()) {
    on<Getcategories>(_ongetCategories);
    on<Getcategoriesserver>(_ongetCategoriesserver);
    on<categorySaveUserSession>(_oncategorySaveUserSession);
  }

  Future<void> _oncategorySaveUserSession(categorySaveUserSession event,
      Emitter<ClientCategoryListState> emit) async {
    await authUseCases.savelistcategory.run(event.list);
  }

  Future<void> _ongetCategories(
      Getcategories event, Emitter<ClientCategoryListState> emit) async {
    emit(state.copyWith(response: Loading()));

    var response = await authUseCases.getcategorysession.rum();
    Resource responses = await categoriesUseCase.getcategory.run();

    // ignore: unnecessary_null_comparison
    if (response != null) {
      emit(state.copyWith(response: Success(response)));
      Fluttertoast.showToast(
          msg: 'no entro server', toastLength: Toast.LENGTH_LONG);
    } else {
      emit(state.copyWith(response: responses));
      Fluttertoast.showToast(
          msg: 'entro server', toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> _ongetCategoriesserver(
      Getcategoriesserver event, Emitter<ClientCategoryListState> emit) async {
    emit(state.copyWith(response: Loading()));

    var response = await authUseCases.getcategorysession.rum();
    Fluttertoast.showToast(
        msg: response[0].notification.toString(),
        toastLength: Toast.LENGTH_LONG);
    emit(state.copyWith(response: Success(response)));
  }
}
