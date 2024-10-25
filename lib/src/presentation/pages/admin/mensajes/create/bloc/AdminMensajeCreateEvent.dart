import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';

abstract class AdminMensajeCreateEvent extends Equatable {
  const AdminMensajeCreateEvent();

  @override
  List<Object?> get props => [];
}

class AdminCategoriInitEvent extends AdminMensajeCreateEvent {
  const AdminCategoriInitEvent();
  @override
  List<Object?> get props => [];
}

class TituloChanged extends AdminMensajeCreateEvent {
  final BlocForItem titulo;
  const TituloChanged({required this.titulo});
  @override
  List<Object?> get props => [titulo];
}

class descriptionChanged extends AdminMensajeCreateEvent {
  final BlocForItem description;
  const descriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class FormSubmit extends AdminMensajeCreateEvent {
  
  const FormSubmit( );
  @override
  List<Object?> get props => [ ];
}

class ResetForm extends AdminMensajeCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

 
