 

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
 

import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/mensajes/create/bloc/profMensajeCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/mensajes/create/bloc/profMensajeCreateState.dart';
 
 

import '../../../../../../domain/useCases/mensaje/MensajeUseCases.dart';
 

class profMensajeCreateBloc
    extends Bloc<profMensajeCreateEvent, profMensajeCreateState> {
  MensajeUseCases mensajeUseCase;
  profMensajeCreateBloc(this.mensajeUseCase)
      : super(profMensajeCreateState()) {
    on<profCategoriInitEvent>(_onInitevEvent);
    on<TituloChanged>(_ontituloChanged);
    on<descriptionChanged>(_ondescriptionChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitevEvent(profCategoriInitEvent event,
      Emitter<profMensajeCreateState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _ontituloChanged(
      TituloChanged event, Emitter<profMensajeCreateState> emit) async {
    emit(state.copyWith(
        titulo: BlocForItem(
            value: event.titulo.value,
            error: event.titulo.value.isNotEmpty ? null : 'ingrese el titulo '),
        formKey: formKey));
  }

  Future<void> _ondescriptionChanged(
      descriptionChanged event, Emitter<profMensajeCreateState> emit) async {
    emit(state.copyWith(
        description: BlocForItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'ingrese el nombre '),
        formKey: formKey));
  }

    Future<void> _onFormSubmit(
        FormSubmit event, Emitter<profMensajeCreateState> emit) async {
      emit(state.copyWith(response: Loading(), formKey: formKey));
     Resource respuesta = await mensajeUseCase.post.run(state.titulo.value,state.description.value);
        emit(state.copyWith(response: respuesta, formKey: formKey));
    }

  Future<void> _onResetForm(
      ResetForm event, Emitter<profMensajeCreateState> emit) async {
    emit(state.restForm());

    // emit(state.copyWith(file: null));
  }

 
}
