import 'package:equatable/equatable.dart';
 
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';

abstract class profMensajeCreateEvent extends Equatable {
  const profMensajeCreateEvent();

  @override
  List<Object?> get props => [];
}

class profCategoriInitEvent extends profMensajeCreateEvent {
  const profCategoriInitEvent();
  @override
  List<Object?> get props => [];
}

class TituloChanged extends profMensajeCreateEvent {
  final BlocForItem titulo;
  const TituloChanged({required this.titulo});
  @override
  List<Object?> get props => [titulo];
}

class descriptionChanged extends profMensajeCreateEvent {
  final BlocForItem description;
  const descriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class FormSubmit extends profMensajeCreateEvent {
  
  const FormSubmit( );
  @override
  List<Object?> get props => [ ];
}

class ResetForm extends profMensajeCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

 
