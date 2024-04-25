import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ProfileUpdateState extends Equatable {
  final BlocForItem name;
  final BlocForItem lastname;
  final BlocForItem phone;
  final File? image;
  final int id;
  final Resource? response;
  final GlobalKey<FormState>? formKey;
  const ProfileUpdateState(
      {this.name = const BlocForItem(error: 'ingrese el nombre'),
      this.lastname = const BlocForItem(error: 'ingrese apellidp'),
      this.phone = const BlocForItem(error: 'ingrese el telefono'),
      this.formKey,
      this.response,
      this.image,
      this.id = 0});

  toUser() =>
      User(name: name.value, lastname: lastname.value, phone: phone.value);

  ProfileUpdateState copyWith(
      {int? id,
      BlocForItem? name,
      BlocForItem? lastname,
      BlocForItem? phone,
      File? image,
      Resource? response,
      GlobalKey<FormState>? formKey}) {
    return ProfileUpdateState(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        lastname: lastname ?? this.lastname,
        phone: phone ?? this.phone,
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image, lastname, phone, response];
}
