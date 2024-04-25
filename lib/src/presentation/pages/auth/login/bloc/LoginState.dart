import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class LoginState extends Equatable {
  final BlocForItem email;
  final BlocForItem password;
  final Resource? response;
  final GlobalKey<FormState>? formKey;
  const LoginState(
      {this.email = const BlocForItem(error: 'ingresa el email'),
      this.password = const BlocForItem(error: 'ingresa el password'),
      this.formKey,
      this.response});

  LoginState copyWith(
      {BlocForItem? email,
      BlocForItem? password,
      Resource? response,
      GlobalKey<FormState>? formKey}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, response];
}
