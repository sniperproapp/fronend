import 'package:flutter_bloc/flutter_bloc.dart';

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
    on<Limpiarlistnotificacion>(_onLimpiarlistnotificacion);
    on<Getcategories>(_onGetcategories);
    on<categorySaveUserSession>(_oncategorySaveUserSession);
  }

  Future<void> _oncategorySaveUserSession(categorySaveUserSession event,
      Emitter<ClientCategoryListState> emit) async {
    await authUseCases.savelistcategory.run(event.list);
  }

  Future<void> _onGetcategories(
      Getcategories event, Emitter<ClientCategoryListState> emit) async {
    emit(state.copyWith(response: Loading()));

    var response = await authUseCases.getcategorysession.rum();
    Resource responses = await categoriesUseCase.getcategory.run();

    // ignore: unnecessary_null_comparison
    if (response != null) {
      emit(state.copyWith(response: Success(response)));
    } else {
      emit(state.copyWith(response: responses));
    }
  }

  Future<void> _onLimpiarlistnotificacion(Limpiarlistnotificacion event,
      Emitter<ClientCategoryListState> emit) async {
    emit(state.copyWith(response: Loading()));

    var response = await authUseCases.getcategorysession.rum();

    response[0].notification = 0;
    var indice = response.indexWhere((indice) => indice.name == event.name);

    response[indice].notification = 0;

    emit(state.copyWith(response: Success(response)));
    await authUseCases.savelistcategory.run(response);
  }
}
