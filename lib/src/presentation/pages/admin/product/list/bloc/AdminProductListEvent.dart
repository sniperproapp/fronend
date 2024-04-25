import 'package:equatable/equatable.dart';

abstract class AdminProductListEvent extends Equatable {
  const AdminProductListEvent();
  @override
  List<Object?> get props => [];
}

class GetProductByCategory extends AdminProductListEvent {
  final int idcategory;
  const GetProductByCategory({required this.idcategory});

  @override
  List<Object?> get props => [idcategory];
}

class Deleteproduct extends AdminProductListEvent {
  final int id;
  const Deleteproduct({required this.id});
  @override
  List<Object?> get props => [id];
}

class Activatetp1change extends AdminProductListEvent {
  final int id;
  final int numero;
  const Activatetp1change({required this.id, required this.numero});
  @override
  List<Object?> get props => [id, numero];
}
