import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/bloc/LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthUseCases authUseCases;
  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<InitEvent>(_onInitChange);
    on<LoginFormReset>(_onLoginFormReset);
    on<loginSaveUserSession>(_onLoginSaveUserSession);
    on<EmailChanged>(_onEmailChange);
    on<PasswordChanged>(_onPasswordChange);
    on<LoginSubmit>(_onLoginSubmit);
  }
  final formKey = GlobalKey<FormState>();
  Future<void> _onInitChange(InitEvent event, Emitter<LoginState> emit) async {
    AuthResponse? authResponse = await authUseCases.getusersession.rum();

    emit(state.copyWith(formKey: formKey));

    if (authResponse != null) {
      emit(state.copyWith(response: Success(authResponse), formKey: formKey));
    }
  }

  Future<void> _onLoginFormReset(
      LoginFormReset event, Emitter<LoginState> emit) async {
    state.formKey?.currentState?.reset();
  }

  Future<void> _onLoginSaveUserSession(
      loginSaveUserSession event, Emitter<LoginState> emit) async {
    await authUseCases.saveusersession.run(event.authResponse);
  }

  Future<void> _onEmailChange(
      EmailChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        email: BlocForItem(
            value: event.email.value,
            error: event.email.value.isNotEmpty ? null : 'ingresa el email'),
        formKey: formKey));
  }

  Future<void> _onPasswordChange(
      PasswordChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        password: BlocForItem(
            value: event.password.value,
            error:
                event.password.value.isNotEmpty ? null : 'ingresa el password'),
        formKey: formKey));
  }

  Future<void> _onLoginSubmit(
      LoginSubmit event, Emitter<LoginState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    // await Future.delayed(Duration(seconds: 3));
    Resource<AuthResponse> response = await authUseCases.login
        .run(state.email.value.trim(), state.password.value);
    emit(state.copyWith(response: response, formKey: formKey));
  }
}
