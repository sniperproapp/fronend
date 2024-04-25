import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class AdminCategoryCreateState extends Equatable {
  final BlocForItem name;
  final BlocForItem description;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
  final File? file;

  const AdminCategoryCreateState(
      {this.name = const BlocForItem(error: 'ingresa el nombre'),
      this.description = const BlocForItem(error: 'ingresa la descripcion'),
      this.file,
      this.formKey,
      this.response});

  tocategory() => Category(name: name.value, description: description.value);
  AdminCategoryCreateState restForm() {
    return AdminCategoryCreateState(
      name: const BlocForItem(error: 'ingresa el nombre'),
      description: const BlocForItem(error: 'ingresa la descripcion'),
    );
  }

  AdminCategoryCreateState copyWith(
      {BlocForItem? name,
      BlocForItem? description,
      GlobalKey<FormState>? formKey,
      Resource? response,
      File? file}) {
    return AdminCategoryCreateState(
        name: name ?? this.name,
        description: description ?? this.description,
        file: file ?? this.file,
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, description, file, response];
}
