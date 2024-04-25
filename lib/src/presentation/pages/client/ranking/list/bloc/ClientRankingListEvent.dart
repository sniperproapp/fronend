import 'package:equatable/equatable.dart';

abstract class ClientRankingListEvent extends Equatable {
  const ClientRankingListEvent();

  @override
  List<Object?> get props => [];
}

class GetRanking extends ClientRankingListEvent {
  const GetRanking();
}
