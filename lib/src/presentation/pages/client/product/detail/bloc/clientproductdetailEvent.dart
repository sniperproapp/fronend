import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';

abstract class clientproductdetailEvent extends Equatable {
  const clientproductdetailEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Initdetail extends clientproductdetailEvent {
  final Product? product;

  const Initdetail({required this.product});
  @override
  List<Object?> get props => [product];
}

class Changeid extends clientproductdetailEvent {
  final int id;

  const Changeid({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class Restargif extends clientproductdetailEvent {
  final int id;

  const Restargif({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class Changelike extends clientproductdetailEvent {
  final String like;
  final int bandera;

  const Changelike({required this.like, required this.bandera});
  @override
  // TODO: implement props
  List<Object?> get props => [like, bandera];
}

class Changeproduct extends clientproductdetailEvent {
  final int id;
  final String like;

  const Changeproduct({required this.id, required this.like});
  @override
  // TODO: implement props
  List<Object?> get props => [id, like];
}
