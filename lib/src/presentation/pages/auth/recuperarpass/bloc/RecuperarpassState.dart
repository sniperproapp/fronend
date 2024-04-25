import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/domain/models/User.dart';

class RecuperarpassState extends Equatable {
  final BlocForItem email;

  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const RecuperarpassState(
      {this.email = const BlocForItem(error: 'ingresa el email'),
      this.formKey,
      this.response});

  RecuperarpassState copywith(
      {BlocForItem? email, Resource? response, GlobalKey<FormState>? formKey}) {
    return RecuperarpassState(
        email: email ?? this.email, formKey: formKey, response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, response];
}
