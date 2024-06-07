import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/bloc/RecuperarpassEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/bloc/RecuperarpassState.dart';

class RecuperarpassBloc extends Bloc<RecuperarpassEvent, RecuperarpassState> {
  AuthUseCases authUseCases;
  RecuperarpassBloc(this.authUseCases) : super(RecuperarpassState()) {
    on<RecuperarpassEmailChanged>(_onEmailChange);

    on<RecuperarpassFormSubmit>(_onFormSubmitChange);
    on<RecuperarpassFormReset>(_onFormResetChange);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onEmailChange(
      RecuperarpassEmailChanged event, Emitter<RecuperarpassState> emit) async {
    emit(state.copywith(
        email: BlocForItem(
            value: event.email.value,
            error: event.email.value.isNotEmpty ? null : 'ingresa el email'),
        formKey: formKey));
  }

  Future<void> _onFormSubmitChange(
      RecuperarpassFormSubmit event, Emitter<RecuperarpassState> emit) async {
    emit(state.copywith(response: Loading(), formKey: formKey));

    Resource response =
        await authUseCases.enviarmail.run(state.email.value.trim());
    emit(state.copywith(response: response, formKey: formKey));
  }

  Future<void> _onFormResetChange(
      RecuperarpassFormReset event, Emitter<RecuperarpassState> emit) async {
    state.formKey?.currentState?.reset();
  }
}
