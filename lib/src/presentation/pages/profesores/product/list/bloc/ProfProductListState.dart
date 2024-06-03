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
  final bool? priceactivate1;
  final bool? priceactivate2;
  final bool? priceactivate3;

  const ProfProductListState(
      {this.response,
      this.activatetp1,
      this.activatetp2,
      this.activatetp3,
      this.activatetp4,
      this.activatetp5,
      this.priceactivate1,
      this.priceactivate2,
      this.priceactivate3,
      this.descarte,
      this.slactivate});

  ProfProductListState copyWith(
      {Resource? response,
      bool? activatetp1,
      bool? activatetp2,
      bool? activatetp3,
      bool? activatetp4,
      bool? activatetp5,
      bool? priceactivate1,
      bool? priceactivate2,
      bool? priceactivate3,
      bool? descarte,
      bool? slactivate}) {
    return ProfProductListState(
        response: response,
        activatetp1: activatetp1,
        activatetp2: activatetp2,
        activatetp3: activatetp3,
        activatetp4: activatetp4,
        activatetp5: activatetp5,
        priceactivate1: priceactivate1,
        priceactivate2: priceactivate2,
        priceactivate3: priceactivate3,
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
        priceactivate1,
        priceactivate2,
        priceactivate3,
        slactivate,
        descarte
      ];
}
