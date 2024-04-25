import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/CategoriesUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/create/bloc/ProfCategoryCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/create/bloc/ProfCategoryCreateState.dart';

class ProfCategoryCreateBloc
    extends Bloc<ProfCategoryCreateEvent, ProfCategoryCreateState> {
  CategoriesUseCase categoriesUseCase;
  ProfCategoryCreateBloc(this.categoriesUseCase)
      : super(ProfCategoryCreateState()) {
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
      Emitter<ProfCategoryCreateState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChanged(
      NameChanged event, Emitter<ProfCategoryCreateState> emit) async {
    emit(state.copyWith(
        name: BlocForItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _ondescriptionChanged(
      descriptionChanged event, Emitter<ProfCategoryCreateState> emit) async {
    emit(state.copyWith(
        description: BlocForItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<ProfCategoryCreateState> emit) async {
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
      ResetForm event, Emitter<ProfCategoryCreateState> emit) async {
    emit(state.restForm());

    // emit(state.copyWith(file: null));
  }

  Future<void> _onCategoryUpdatePickImage(CategoryUpdatePickImage event,
      Emitter<ProfCategoryCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(file: File(image.path)));
    }
  }

  Future<void> _onCategoryUpdateTakePhoto(CategoryUpdateTakePhoto event,
      Emitter<ProfCategoryCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }
}
