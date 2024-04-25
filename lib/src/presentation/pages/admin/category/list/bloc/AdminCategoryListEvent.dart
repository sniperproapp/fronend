import 'package:equatable/equatable.dart';

abstract class AdminCategoryListEvent extends Equatable {
  const AdminCategoryListEvent();

  @override
  List<Object?> get props => [];
}

class Getcategories extends AdminCategoryListEvent {
  const Getcategories();
}

class DeleteCategory extends AdminCategoryListEvent {
  final int id;
  const DeleteCategory({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
