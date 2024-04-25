import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object?> get props => [];
}

class RegisterIniteven extends RegisterEvent {
  const RegisterIniteven();
}

class RegisterNameChanged extends RegisterEvent {
  final BlocForItem name;
  const RegisterNameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class RegisterLastnameChanged extends RegisterEvent {
  final BlocForItem lastname;
  const RegisterLastnameChanged({required this.lastname});
  @override
  List<Object?> get props => [lastname];
}

class RegisterEmailChanged extends RegisterEvent {
  final BlocForItem email;
  const RegisterEmailChanged({required this.email});
  @override
  List<Object?> get props => [email];
}

class RegisterPhoneChanged extends RegisterEvent {
  final BlocForItem phone;
  const RegisterPhoneChanged({required this.phone});
  @override
  List<Object?> get props => [phone];
}

class RegisterPasswordChanged extends RegisterEvent {
  final BlocForItem password;
  const RegisterPasswordChanged({required this.password});
  @override
  List<Object?> get props => [password];
}

class RegisterConfirPasswordChanged extends RegisterEvent {
  final BlocForItem confirpassword;
  const RegisterConfirPasswordChanged({required this.confirpassword});
  @override
  List<Object?> get props => [confirpassword];
}

class RegisterFormSubmit extends RegisterEvent {
  const RegisterFormSubmit();
}

class RegisterFormReset extends RegisterEvent {
  const RegisterFormReset();
}
