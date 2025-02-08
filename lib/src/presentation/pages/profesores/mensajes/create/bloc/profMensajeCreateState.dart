import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
 
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class profMensajeCreateState extends Equatable {
  final BlocForItem titulo;
  final BlocForItem description;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
   

  const profMensajeCreateState(
      {this.titulo = const BlocForItem(error: 'ingresa el nombre'),
      this.description = const BlocForItem(error: 'ingresa la descripcion'),
      this.formKey,
      this.response});

 // toMensaje() => Mensaje(titulo: titulo.value, description: description.value);
  profMensajeCreateState restForm() {
    return profMensajeCreateState(
      titulo: const BlocForItem(error: 'ingresa el titulo'),
      description: const BlocForItem(error: 'ingresa la descripcion'),
    );
  }

  profMensajeCreateState copyWith(
      {BlocForItem? titulo,
      BlocForItem? description,
      GlobalKey<FormState>? formKey,
      Resource? response,
      File? file}) {
    return profMensajeCreateState(
        titulo: titulo ?? this.titulo,
        description: description ?? this.description,
        
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [titulo, description,  response];
}
