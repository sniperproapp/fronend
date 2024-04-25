import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProductListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProductListState.dart';

class ProfProducListBloc
    extends Bloc<ProfProductListEvent, ProfProductListState> {
  ProductsUseCase productsUseCase;
  AuthUseCases authUseCases;
  ProfProducListBloc(this.productsUseCase, this.authUseCases)
      : super(ProfProductListState()) {
    on<GetProductByCategory>(_onGetProductByCategory);
    on<Deleteproduct>(_onDeleteproduct);
    on<Activatetp1change>(_onActivatetpchange);
  }

  Future<void> _onGetProductByCategory(
      GetProductByCategory event, Emitter<ProfProductListState> emit) async {
    emit(state.copyWith(response: Loading()));
    AuthResponse authResponse = await authUseCases.getusersession.rum();

    Resource response = await productsUseCase.getProductByCategoryuser
        .run(event.idcategory, authResponse.user.id ?? 0);

    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteproduct(
      Deleteproduct event, Emitter<ProfProductListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await productsUseCase.delete.run(event.id);

    emit(state.copyWith(response: response));
  }

  Future<void> _onActivatetpchange(
      Activatetp1change event, Emitter<ProfProductListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response =
        await productsUseCase.activatetp.run(event.id, event.numero);

    emit(state.copyWith(response: response));
  }
}
