import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';

abstract class ProfCategoryCreateEvent extends Equatable {
  const ProfCategoryCreateEvent();

  @override
  List<Object?> get props => [];
}

class ProfCategoriInitEvent extends ProfCategoryCreateEvent {
  const ProfCategoriInitEvent();
  @override
  List<Object?> get props => [];
}

class NameChanged extends ProfCategoryCreateEvent {
  final BlocForItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class descriptionChanged extends ProfCategoryCreateEvent {
  final BlocForItem description;
  const descriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class FormSubmit extends ProfCategoryCreateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends ProfCategoryCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

class CategoryUpdatePickImage extends ProfCategoryCreateEvent {
  const CategoryUpdatePickImage();
}

class CategoryUpdateTakePhoto extends ProfCategoryCreateEvent {
  const CategoryUpdateTakePhoto();
}
