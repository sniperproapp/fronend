import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';

abstract class ProfCategoryUpdateEvent extends Equatable {
  const ProfCategoryUpdateEvent();

  @override
  List<Object?> get props => [];
}

class ProfCategoriInitEvent extends ProfCategoryUpdateEvent {
  final Category? category;
  const ProfCategoriInitEvent({required this.category});
  @override
  List<Object?> get props => [category];
}

class NameChanged extends ProfCategoryUpdateEvent {
  final BlocForItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class descriptionChanged extends ProfCategoryUpdateEvent {
  final BlocForItem description;
  const descriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class FormSubmit extends ProfCategoryUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class CategoryUpdatePickImage extends ProfCategoryUpdateEvent {
  const CategoryUpdatePickImage();
}

class CategoryUpdateTakePhoto extends ProfCategoryUpdateEvent {
  const CategoryUpdateTakePhoto();
}

class ResetForm extends ProfCategoryUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}
