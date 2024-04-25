import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProductListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProductListState.dart';

class ClientProducListBloc
    extends Bloc<ClientProductListEvent, ClientProductListState> {
  ProductsUseCase productsUseCase;

  ClientProducListBloc(this.productsUseCase) : super(ClientProductListState()) {
    on<GetProductByCategory>(_onGetProductByCategory);
    on<Changeidlist>(_onChangeidlist);
    on<Initdetaillists>(_oninitdetaillist);
  }

  Future<void> _onGetProductByCategory(
      GetProductByCategory event, Emitter<ClientProductListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await productsUseCase.getProductByCategory
        .run(event.idcategory, event.estado);

    emit(state.copyWith(response: response));
  }

  Future<void> _onChangeidlist(
      Changeidlist event, Emitter<ClientProductListState> emit) async {
    Resource response = await productsUseCase.like.run(event.id, 1);
    print(response);
    emit(state.copyWith(response: Success(true), index: event.index));
  }

  Future<void> _oninitdetaillist(
      Initdetaillists event, Emitter<ClientProductListState> emit) async {
    emit(state.copyWith(like: event.product?.like.toString()));
  }
}
