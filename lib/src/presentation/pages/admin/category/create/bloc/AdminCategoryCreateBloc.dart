import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/CategoriesUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateState.dart';

class AdminCategoryCreateBloc
    extends Bloc<AdminCategoryCreateEvent, AdminCategoryCreateState> {
  CategoriesUseCase categoriesUseCase;
  AdminCategoryCreateBloc(this.categoriesUseCase)
      : super(AdminCategoryCreateState()) {
    on<AdminCategoriInitEvent>(_onInitevEvent);
    on<NameChanged>(_onNameChanged);
    on<descriptionChanged>(_ondescriptionChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    on<CategoryUpdateTakePhoto>(_onCategoryUpdateTakePhoto);
    on<CategoryUpdatePickImage>(_onCategoryUpdatePickImage);
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitevEvent(AdminCategoriInitEvent event,
      Emitter<AdminCategoryCreateState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChanged(
      NameChanged event, Emitter<AdminCategoryCreateState> emit) async {
    emit(state.copyWith(
        name: BlocForItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _ondescriptionChanged(
      descriptionChanged event, Emitter<AdminCategoryCreateState> emit) async {
    emit(state.copyWith(
        description: BlocForItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<AdminCategoryCreateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    if (state.file != null) {
      Resource response =
          await categoriesUseCase.create.run(state.tocategory(), state.file!);

      emit(state.copyWith(response: response, formKey: formKey));
    } else {
      emit(state.copyWith(
          response: Error('seleciona la imagen'), formKey: formKey));
    }
  }

  Future<void> _onResetForm(
      ResetForm event, Emitter<AdminCategoryCreateState> emit) async {
    emit(state.restForm());

    // emit(state.copyWith(file: null));
  }

  Future<void> _onCategoryUpdatePickImage(CategoryUpdatePickImage event,
      Emitter<AdminCategoryCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(file: File(image.path)));
    }
  }

  Future<void> _onCategoryUpdateTakePhoto(CategoryUpdateTakePhoto event,
      Emitter<AdminCategoryCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }
}
