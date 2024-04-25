import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';

abstract class ClientProductListEvent extends Equatable {
  const ClientProductListEvent();
  @override
  List<Object?> get props => [];
}

class GetProductByCategory extends ClientProductListEvent {
  final int idcategory;
  final String estado;
  const GetProductByCategory({required this.idcategory, required this.estado});

  @override
  List<Object?> get props => [idcategory, estado];
}

class Changeidlist extends ClientProductListEvent {
  final int id;
  final int index;

  const Changeidlist({required this.id, required this.index});
  @override
  // TODO: implement props
  List<Object?> get props => [id, index];
}

class Initdetaillists extends ClientProductListEvent {
  final Product? product;

  const Initdetaillists({required this.product});
  @override
  List<Object?> get props => [product];
}
