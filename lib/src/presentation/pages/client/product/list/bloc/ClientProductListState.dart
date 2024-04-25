import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ClientProductListState extends Equatable {
  final Resource? response;
  final int? id;
  final int? index;
  final String? like;
  const ClientProductListState(
      {this.response, this.id = 0, this.index, this.like});

  ClientProductListState copyWith(
      {Resource? response, int? id, int? index, String? like}) {
    return ClientProductListState(
        response: response, id: id, like: like, index: index);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response, id, like, index];
}
