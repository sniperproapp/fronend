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

class Getcategoriesserver extends ClientCategoryListEvent {
  const Getcategoriesserver();
}

class categorySaveUserSession extends ClientCategoryListEvent {
  final List<Category> list;
  const categorySaveUserSession({required this.list});

  @override
  List<Object?> get props => [list];
}
