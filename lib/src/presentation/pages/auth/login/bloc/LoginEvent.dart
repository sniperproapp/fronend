import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class InitEvent extends LoginEvent {
  const InitEvent();
}

class EmailChanged extends LoginEvent {
  final BlocForItem email;
  const EmailChanged({required this.email});
  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final BlocForItem password;
  const PasswordChanged({required this.password});
  @override
  List<Object> get props => [password];
}

class LoginFormReset extends LoginEvent {
  const LoginFormReset();
}

class LoginSubmit extends LoginEvent {
  const LoginSubmit();
}

class loginSaveUserSession extends LoginEvent {
  final AuthResponse authResponse;
  const loginSaveUserSession({required this.authResponse});

  @override
  List<Object?> get props => [authResponse];
}
