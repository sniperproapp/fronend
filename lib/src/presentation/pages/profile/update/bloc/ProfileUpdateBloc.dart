import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/user/UsersUseCases.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  UsersUseCases usersUseCases;
  AuthUseCases authUseCases;

  ProfileUpdateBloc(this.usersUseCases, this.authUseCases)
      : super(ProfileUpdateState()) {
    on<ProfileUpdateNameChange>(_onnamechange);
    on<ProfileUpdateUpdateUserSesion>(_onProfileUpdateUpdateUserSesion);
    on<ProfileUpdateInitEvent>(_oninitevent);
    on<ProfileUpdateTakePhoto>(_onProfileUpdateTakePhoto);
    on<ProfileUpdatePickImage>(_onProfileUpdatePickImage);
    on<ProfileUpdatelastnameChange>(_onlastnamechange);
    on<ProfileUpdatephoneChange>(_onphonechange);
    on<profileupdateformsubmit>(_onFormSubmit);
  }

  final formKey = GlobalKey<FormState>();
  Future<void> _oninitevent(
      ProfileUpdateInitEvent event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
        id: event.user?.id,
        name: BlocForItem(value: event.user?.name ?? ''),
        lastname: BlocForItem(value: event.user?.lastname ?? ''),
        phone: BlocForItem(value: event.user?.phone ?? ''),
        formKey: formKey));
  }

  Future<void> _onnamechange(
      ProfileUpdateNameChange event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
        name: BlocForItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'ingeresa el nombre'),
        formKey: formKey));
  }

  Future<void> _onlastnamechange(ProfileUpdatelastnameChange event,
      Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
        lastname: BlocForItem(
            value: event.lastname.value,
            error: event.lastname.value.isNotEmpty
                ? null
                : 'ingeresa el apellido'),
        formKey: formKey));
  }

  Future<void> _onphonechange(
      ProfileUpdatephoneChange event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
        phone: BlocForItem(
            value: event.phone.value,
            error:
                event.phone.value.isNotEmpty ? null : 'ingeresa el telefono'),
        formKey: formKey));
  }

  Future<void> _onProfileUpdatePickImage(
      ProfileUpdatePickImage event, Emitter<ProfileUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(image: File(image.path)));
    }
  }

  Future<void> _onProfileUpdateTakePhoto(
      ProfileUpdateTakePhoto event, Emitter<ProfileUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(image: File(image.path)));
    }
  }

  Future<void> _onFormSubmit(
      profileupdateformsubmit event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    Resource response = await usersUseCases.updateuser
        .run(state.id, state.toUser(), state.image);

    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onProfileUpdateUpdateUserSesion(
      ProfileUpdateUpdateUserSesion event,
      Emitter<ProfileUpdateState> emit) async {
    AuthResponse authResponse = await authUseCases.getusersession.rum();
    authResponse.user.name = event.user.name;
    authResponse.user.phone = event.user.phone;
    authResponse.user.lastname = event.user.lastname;
    authResponse.user.imagen = event.user.imagen;
    await authUseCases.saveusersession.run(authResponse);
  }
}
