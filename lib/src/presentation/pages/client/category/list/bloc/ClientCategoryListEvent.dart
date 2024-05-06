import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';

abstract class ClientCategoryListEvent extends Equatable {
  const ClientCategoryListEvent();

  @override
  List<Object?> get props => [];
}

class Getcategories extends ClientCategoryListEvent {
  const Getcategories();
}

class Limpiarlistnotificacion extends ClientCategoryListEvent {
  final String name;
  const Limpiarlistnotificacion({required this.name});
  @override
  List<Object?> get props => [name];
}

class categorySaveUserSession extends ClientCategoryListEvent {
  final List<Category> list;
  const categorySaveUserSession({required this.list});

  @override
  List<Object?> get props => [list];
}
