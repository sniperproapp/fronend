import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sniper_pro/src/domain/useCases/zoom/ZoomUseCases.dart';

import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/bloc/AdminZoomUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/bloc/AdminZoomUpdateState.dart';

class AdminZoomUpdateBloc
    extends Bloc<AdminZoomUpdateEvent, AdminZoomUpdateState> {
  ZoomUseCases zoomUseCase;
  AdminZoomUpdateBloc(this.zoomUseCase) : super(AdminZoomUpdateState()) {
    on<AdminzoomInitEvent>(_onInitevEvent);
    on<LinkChanged>(_onLinkChanged);

    on<NameChanged>(_onNameChanged);
    on<descriptionChanged>(_ondescriptionChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    on<ZoomUpdateTakePhoto>(_onZoomUpdateTakePhoto);
    on<ZoomUpdatePickImage>(_onZoomUpdatePickImage);
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitevEvent(
      AdminzoomInitEvent event, Emitter<AdminZoomUpdateState> emit) async {
    emit(state.copyWith(
        id: event.zoom?.id,
        name: BlocForItem(value: event.zoom?.name ?? ''),
        link: BlocForItem(value: event.zoom?.link ?? ''),
        description: BlocForItem(value: event.zoom?.description ?? ''),
        formKey: formKey));
  }

  Future<void> _onNameChanged(
      NameChanged event, Emitter<AdminZoomUpdateState> emit) async {
    emit(state.copyWith(
        name: BlocForItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _onLinkChanged(
      LinkChanged event, Emitter<AdminZoomUpdateState> emit) async {
    emit(state.copyWith(
        link: BlocForItem(
            value: event.link.value,
            error: event.link.value.isNotEmpty ? null : 'ingrese el link '),
        formKey: formKey));
  }

  Future<void> _ondescriptionChanged(
      descriptionChanged event, Emitter<AdminZoomUpdateState> emit) async {
    emit(state.copyWith(
        description: BlocForItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<AdminZoomUpdateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    Resource response =
        await zoomUseCase.update.run(state.id, state.toZoom(), state.file);

    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onZoomUpdatePickImage(
      ZoomUpdatePickImage event, Emitter<AdminZoomUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onZoomUpdateTakePhoto(
      ZoomUpdateTakePhoto event, Emitter<AdminZoomUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onResetForm(
      ResetForm event, Emitter<AdminZoomUpdateState> emit) async {
    emit(state.restForm());
  }
}
