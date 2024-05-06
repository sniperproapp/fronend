import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ProfProductListState extends Equatable {
  final Resource? response;
  final bool? activatetp1;
  final bool? activatetp2;
  final bool? activatetp3;
  final bool? activatetp4;
  final bool? activatetp5;
  final bool? descarte;
  final bool? slactivate;

  const ProfProductListState(
      {this.response,
      this.activatetp1,
      this.activatetp2,
      this.activatetp3,
      this.activatetp4,
      this.activatetp5,
      this.descarte,
      this.slactivate});

  ProfProductListState copyWith(
      {Resource? response,
      bool? activatetp1,
      bool? activatetp2,
      bool? activatetp3,
      bool? activatetp4,
      bool? activatetp5,
      bool? descarte,
      bool? slactivate}) {
    return ProfProductListState(
        response: response,
        activatetp1: activatetp1,
        activatetp2: activatetp2,
        activatetp3: activatetp3,
        activatetp4: activatetp4,
        descarte: descarte,
        slactivate: slactivate ?? this.slactivate);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        response,
        activatetp1,
        activatetp2,
        activatetp3,
        activatetp4,
        activatetp5,
        slactivate,
        descarte
      ];
}
