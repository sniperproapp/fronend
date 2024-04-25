import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';

abstract class AdminCategoryCreateEvent extends Equatable {
  const AdminCategoryCreateEvent();

  @override
  List<Object?> get props => [];
}

class AdminCategoriInitEvent extends AdminCategoryCreateEvent {
  const AdminCategoriInitEvent();
  @override
  List<Object?> get props => [];
}

class NameChanged extends AdminCategoryCreateEvent {
  final BlocForItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class descriptionChanged extends AdminCategoryCreateEvent {
  final BlocForItem description;
  const descriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class FormSubmit extends AdminCategoryCreateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminCategoryCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

class CategoryUpdatePickImage extends AdminCategoryCreateEvent {
  const CategoryUpdatePickImage();
}

class CategoryUpdateTakePhoto extends AdminCategoryCreateEvent {
  const CategoryUpdateTakePhoto();
}
