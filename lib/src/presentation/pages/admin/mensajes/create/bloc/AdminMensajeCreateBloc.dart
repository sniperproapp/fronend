 

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
 

import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
 
import 'package:sniper_pro/src/presentation/pages/admin/mensajes/create/bloc/AdminMensajeCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/mensajes/create/bloc/AdminMensajeCreateState.dart';

import '../../../../../../domain/useCases/mensaje/MensajeUseCases.dart';
 

class AdminMensajeCreateBloc
    extends Bloc<AdminMensajeCreateEvent, AdminMensajeCreateState> {
  MensajeUseCases mensajeUseCase;
  AdminMensajeCreateBloc(this.mensajeUseCase)
      : super(AdminMensajeCreateState()) {
    on<AdminCategoriInitEvent>(_onInitevEvent);
    on<TituloChanged>(_ontituloChanged);
    on<descriptionChanged>(_ondescriptionChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitevEvent(AdminCategoriInitEvent event,
      Emitter<AdminMensajeCreateState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _ontituloChanged(
      TituloChanged event, Emitter<AdminMensajeCreateState> emit) async {
    emit(state.copyWith(
        titulo: BlocForItem(
            value: event.titulo.value,
            error: event.titulo.value.isNotEmpty ? null : 'ingrese el titulo '),
        formKey: formKey));
  }

  Future<void> _ondescriptionChanged(
      descriptionChanged event, Emitter<AdminMensajeCreateState> emit) async {
    emit(state.copyWith(
        description: BlocForItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'ingrese el nombre '),
        formKey: formKey));
  }

    Future<void> _onFormSubmit(
        FormSubmit event, Emitter<AdminMensajeCreateState> emit) async {
      emit(state.copyWith(response: Loading(), formKey: formKey));
     Resource respuesta = await mensajeUseCase.post.run(state.titulo.value,state.description.value);
        emit(state.copyWith(response: respuesta, formKey: formKey));
    }

  Future<void> _onResetForm(
      ResetForm event, Emitter<AdminMensajeCreateState> emit) async {
    emit(state.restForm());

    // emit(state.copyWith(file: null));
  }

 
}
