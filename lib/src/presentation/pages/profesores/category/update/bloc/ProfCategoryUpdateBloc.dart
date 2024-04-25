import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/CategoriesUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/update/bloc/ProfCategoryUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/update/bloc/ProfCategoryUpdateState.dart';

class ProfCategoryUpdateBloc
    extends Bloc<ProfCategoryUpdateEvent, ProfCategoryUpdateState> {
  CategoriesUseCase categoriesUseCase;
  ProfCategoryUpdateBloc(this.categoriesUseCase)
      : super(ProfCategoryUpdateState()) {
    on<ProfCategoriInitEvent>(_onInitevEvent);
    on<NameChanged>(_onNameChanged);
    on<descriptionChanged>(_ondescriptionChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    on<CategoryUpdateTakePhoto>(_onCategoryUpdateTakePhoto);
    on<CategoryUpdatePickImage>(_onCategoryUpdatePickImage);
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitevEvent(ProfCategoriInitEvent event,
      Emitter<ProfCategoryUpdateState> emit) async {
    emit(state.copyWith(
        id: event.category?.id,
        name: BlocForItem(value: event.category?.name ?? ''),
        description: BlocForItem(value: event.category?.description ?? ''),
        formKey: formKey));
  }

  Future<void> _onNameChanged(
      NameChanged event, Emitter<ProfCategoryUpdateState> emit) async {
    emit(state.copyWith(
        name: BlocForItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _ondescriptionChanged(
      descriptionChanged event, Emitter<ProfCategoryUpdateState> emit) async {
    emit(state.copyWith(
        description: BlocForItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<ProfCategoryUpdateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    Resource response = await categoriesUseCase.update
        .run(state.id, state.tocategory(), state.file);

    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onCategoryUpdatePickImage(CategoryUpdatePickImage event,
      Emitter<ProfCategoryUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onCategoryUpdateTakePhoto(CategoryUpdateTakePhoto event,
      Emitter<ProfCategoryUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onResetForm(
      ResetForm event, Emitter<ProfCategoryUpdateState> emit) async {
    emit(state.restForm());
  }
}
