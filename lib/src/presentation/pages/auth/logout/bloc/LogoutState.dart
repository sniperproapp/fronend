import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class LogoutState extends Equatable {
  final Resource? response;
  final GlobalKey<FormState>? formKey;
  const LogoutState({this.formKey, this.response});

  LogoutState copyWith({Resource? response, GlobalKey<FormState>? formKey}) {
    return LogoutState(formKey: formKey, response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}
