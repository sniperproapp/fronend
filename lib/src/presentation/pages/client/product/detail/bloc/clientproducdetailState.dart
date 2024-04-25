import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ClientproducdetailState extends Equatable {
  final int? id;
  final String? like;
  final int? banderalike;

  final Resource? response;
  const ClientproducdetailState(
      {this.id = 0, this.banderalike, this.like, this.response});

  ClientproducdetailState copyWith(
      {int? id, String? like, int? banderalike, Resource? response}) {
    return ClientproducdetailState(
        id: id, banderalike: banderalike, response: response, like: like);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, response, like, banderalike];
}
