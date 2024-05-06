import 'package:equatable/equatable.dart';

abstract class ProfProductListEvent extends Equatable {
  const ProfProductListEvent();
  @override
  List<Object?> get props => [];
}

class GetProductByCategory extends ProfProductListEvent {
  final int idcategory;
  const GetProductByCategory({required this.idcategory});

  @override
  List<Object?> get props => [idcategory];
}

class Deleteproduct extends ProfProductListEvent {
  final int id;
  const Deleteproduct({required this.id});
  @override
  List<Object?> get props => [id];
}

class Activatetp1change extends ProfProductListEvent {
  final int id;
  final int numero;
  const Activatetp1change({required this.id, required this.numero});
  @override
  List<Object?> get props => [id, numero];
}

class Activateslchange extends ProfProductListEvent {
  final int id;
  final int numero;
  const Activateslchange({required this.id, required this.numero});
  @override
  List<Object?> get props => [id, numero];
}

class Activatedescartechange extends ProfProductListEvent {
  final int id;
  final int numero;
  const Activatedescartechange({required this.id, required this.numero});
  @override
  List<Object?> get props => [id, numero];
}
