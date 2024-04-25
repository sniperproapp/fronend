import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/domain/models/User.dart';

class RegisterState extends Equatable {
  final BlocForItem name;
  final BlocForItem lastname;
  final BlocForItem phone;
  final BlocForItem email;
  final BlocForItem password;
  final BlocForItem confirmpassword;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const RegisterState(
      {this.name = const BlocForItem(error: 'ingresa el nombre'),
      this.lastname = const BlocForItem(error: 'ingresa el apellido'),
      this.email = const BlocForItem(error: 'ingresa el email'),
      this.phone = const BlocForItem(error: 'ingresa el phone'),
      this.password = const BlocForItem(error: 'ingresa el password'),
      this.confirmpassword =
          const BlocForItem(error: 'ingresa el confirpassword'),
      this.formKey,
      this.response});

  toUser() => User(
      name: name.value,
      lastname: lastname.value,
      email: email.value,
      phone: phone.value,
      password: password.value);

  RegisterState copywith(
      {BlocForItem? name,
      BlocForItem? lastname,
      BlocForItem? phone,
      BlocForItem? email,
      BlocForItem? password,
      BlocForItem? confirmpassword,
      Resource? response,
      GlobalKey<FormState>? formKey}) {
    return RegisterState(
        name: name ?? this.name,
        lastname: lastname ?? this.lastname,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmpassword: confirmpassword ?? this.confirmpassword,
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, lastname, email, password, phone, confirmpassword, response];
}
