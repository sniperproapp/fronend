import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/bloc/clientproducdetailState.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/bloc/clientproductdetailEvent.dart';

class ClientproductdetailBloc
    extends Bloc<clientproductdetailEvent, ClientproducdetailState> {
  ProductsUseCase productsUseCase;
  ClientproductdetailBloc(this.productsUseCase)
      : super(ClientproducdetailState()) {
    on<Changeid>(_onChangeid);
    on<Restargif>(_onRestargif);
    on<Initdetail>(_oninitdetail);
    on<Changelike>(_onChangelike);
    on<Changeproduct>(_onChangeproduct);
  }

  Future<void> _onChangeid(
      Changeid event, Emitter<ClientproducdetailState> emit) async {
    //  emit(state.copyWith(id: event.id));

    Resource response = await productsUseCase.like.run(event.id, 1);

    emit(state.copyWith(response: response, banderalike: 1));
  }

  Future<void> _onRestargif(
      Restargif event, Emitter<ClientproducdetailState> emit) async {
    Resource response = await productsUseCase.like.run(event.id, 0);

    emit(state.copyWith(response: response, banderalike: 2));
  }

  Future<void> _oninitdetail(
      Initdetail event, Emitter<ClientproducdetailState> emit) async {
    emit(state.copyWith(like: event.product?.like.toString(), banderalike: 2));
  }

  Future<void> _onChangelike(
      Changelike event, Emitter<ClientproducdetailState> emit) async {
    emit(state.copyWith(like: event.like, banderalike: event.bandera));
  }

  Future<void> _onChangeproduct(
      Changeproduct event, Emitter<ClientproducdetailState> emit) async {
    Resource response = await productsUseCase.product.run(event.id);

    emit(state.copyWith(response: response, like: event.like, banderalike: 2));
  }
}
