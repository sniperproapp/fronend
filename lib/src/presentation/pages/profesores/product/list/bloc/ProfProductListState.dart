import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ProfProductListState extends Equatable {
  final Resource? response;
  final bool? activatetp1;
  final bool? activatetp2;
  final bool? activatetp3;
  final bool? activatetp4;
  final bool? activatetp5;

  const ProfProductListState(
      {this.response,
      this.activatetp1,
      this.activatetp2,
      this.activatetp3,
      this.activatetp4,
      this.activatetp5});

  ProfProductListState copyWith(
      {Resource? response,
      bool? activatetp1,
      bool? activatetp2,
      bool? activatetp3,
      bool? activatetp4,
      bool? activatetp5}) {
    return ProfProductListState(response: response, activatetp1: activatetp1);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        response,
        activatetp1,
        activatetp2,
        activatetp3,
        activatetp4,
        activatetp5
      ];
}
