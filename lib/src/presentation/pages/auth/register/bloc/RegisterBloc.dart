import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/bloc/RegisterState.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthUseCases authUseCases;
  RegisterBloc(this.authUseCases) : super(RegisterState()) {
    on<RegisterIniteven>(_onInitChange);
    on<RegisterNameChanged>(_onNameChange);
    on<RegisterLastnameChanged>(_onLastnameChange);
    on<RegisterEmailChanged>(_onEmailChange);
    on<RegisterPhoneChanged>(_onPhoneChange);
    on<RegisterPasswordChanged>(_onPasswordChange);
    on<RegisterConfirPasswordChanged>(_onConfirPasswordChange);
    on<RegisterFormSubmit>(_onFormSubmitChange);
    on<RegisterFormReset>(_onFormResetChange);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitChange(
      RegisterIniteven event, Emitter<RegisterState> emit) async {
    emit(state.copywith(formKey: formKey));
  }

  Future<void> _onNameChange(
      RegisterNameChanged event, Emitter<RegisterState> emit) async {
    emit(state.copywith(
        name: BlocForItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'ingresa el nombre'),
        formKey: formKey));
  }

  Future<void> _onLastnameChange(
      RegisterLastnameChanged event, Emitter<RegisterState> emit) async {
    emit(state.copywith(
        lastname: BlocForItem(
            value: event.lastname.value,
            error:
                event.lastname.value.isNotEmpty ? null : 'ingresa el apellido'),
        formKey: formKey));
  }

  Future<void> _onEmailChange(
      RegisterEmailChanged event, Emitter<RegisterState> emit) async {
    emit(state.copywith(
        email: BlocForItem(
            value: event.email.value.trim(),
            error: event.email.value.isNotEmpty ? null : 'ingresa el email'),
        formKey: formKey));
  }

  Future<void> _onPhoneChange(
      RegisterPhoneChanged event, Emitter<RegisterState> emit) async {
    emit(state.copywith(
        phone: BlocForItem(
            value: event.phone.value,
            error: event.phone.value.isNotEmpty ? null : 'ingresa el phone'),
        formKey: formKey));
  }

  Future<void> _onPasswordChange(
      RegisterPasswordChanged event, Emitter<RegisterState> emit) async {
    emit(state.copywith(
        password: BlocForItem(
            value: event.password.value,
            error:
                event.password.value.isNotEmpty ? null : 'ingresa el password'),
        formKey: formKey));
  }

  Future<void> _onConfirPasswordChange(
      RegisterConfirPasswordChanged event, Emitter<RegisterState> emit) async {
    emit(state.copywith(
        confirmpassword: BlocForItem(
            value: event.confirpassword.value,
            error: event.confirpassword.value.isNotEmpty
                ? null
                : 'ingresa el confirma password'),
        formKey: formKey));
  }

  Future<void> _onFormSubmitChange(
      RegisterFormSubmit event, Emitter<RegisterState> emit) async {
    emit(state.copywith(response: Loading(), formKey: formKey));

    Resource response = await authUseCases.register.run(state.toUser());
    emit(state.copywith(response: response, formKey: formKey));
  }

  Future<void> _onFormResetChange(
      RegisterFormReset event, Emitter<RegisterState> emit) async {
    state.formKey?.currentState?.reset();
  }
}
