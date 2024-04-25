import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/bloc/AdminProductListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/bloc/AdminProductListState.dart';

class AdminProducListBloc
    extends Bloc<AdminProductListEvent, AdminProductListState> {
  ProductsUseCase productsUseCase;
  AuthUseCases authUseCases;
  AdminProducListBloc(this.productsUseCase, this.authUseCases)
      : super(AdminProductListState()) {
    on<GetProductByCategory>(_onGetProductByCategory);
    on<Deleteproduct>(_onDeleteproduct);
    on<Activatetp1change>(_onActivatetpchange);
  }

  Future<void> _onGetProductByCategory(
      GetProductByCategory event, Emitter<AdminProductListState> emit) async {
    emit(state.copyWith(response: Loading()));
    AuthResponse authResponse = await authUseCases.getusersession.rum();

    Resource response = await productsUseCase.getProductByCategory
        .run(event.idcategory, 'ACTIVO');

    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteproduct(
      Deleteproduct event, Emitter<AdminProductListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await productsUseCase.delete.run(event.id);

    emit(state.copyWith(response: response));
  }

  Future<void> _onActivatetpchange(
      Activatetp1change event, Emitter<AdminProductListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response =
        await productsUseCase.activatetp.run(event.id, event.numero);

    emit(state.copyWith(response: response));
  }
}
