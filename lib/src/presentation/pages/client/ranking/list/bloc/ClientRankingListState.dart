import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ClientRankingListState extends Equatable {
  final Resource? response;

  const ClientRankingListState({this.response});

  ClientRankingListState copyWith({Resource? response}) {
    return ClientRankingListState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}
