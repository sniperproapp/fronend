import 'package:equatable/equatable.dart';

abstract class ProfCategoryListEvent extends Equatable {
  const ProfCategoryListEvent();

  @override
  List<Object?> get props => [];
}

class Getcategories extends ProfCategoryListEvent {
  const Getcategories();
}

class DeleteCategory extends ProfCategoryListEvent {
  final int id;
  const DeleteCategory({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
