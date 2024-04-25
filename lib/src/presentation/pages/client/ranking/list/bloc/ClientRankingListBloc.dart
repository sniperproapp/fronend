import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/ranking/list/bloc/ClientRankingListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/ranking/list/bloc/ClientRankingListState.dart';

class ClientRankingListBloc
    extends Bloc<ClientRankingListEvent, ClientRankingListState> {
  ProductsUseCase productsUseCase;

  ClientRankingListBloc(this.productsUseCase)
      : super(ClientRankingListState()) {
    on<GetRanking>(_ongetRaGetRanking);
  }

  Future<void> _ongetRaGetRanking(
      GetRanking event, Emitter<ClientRankingListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await productsUseCase.ranking.run();

    emit(state.copyWith(response: response));
  }
}
