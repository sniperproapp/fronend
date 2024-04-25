import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';

abstract class AdminCategoryUpdateEvent extends Equatable {
  const AdminCategoryUpdateEvent();

  @override
  List<Object?> get props => [];
}

class AdminCategoriInitEvent extends AdminCategoryUpdateEvent {
  final Category? category;
  const AdminCategoriInitEvent({required this.category});
  @override
  List<Object?> get props => [category];
}

class NameChanged extends AdminCategoryUpdateEvent {
  final BlocForItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class descriptionChanged extends AdminCategoryUpdateEvent {
  final BlocForItem description;
  const descriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class FormSubmit extends AdminCategoryUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class CategoryUpdatePickImage extends AdminCategoryUpdateEvent {
  const CategoryUpdatePickImage();
}

class CategoryUpdateTakePhoto extends AdminCategoryUpdateEvent {
  const CategoryUpdateTakePhoto();
}

class ResetForm extends AdminCategoryUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}
