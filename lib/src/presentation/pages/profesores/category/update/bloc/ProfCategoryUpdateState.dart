import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ProfCategoryUpdateState extends Equatable {
  final int id;
  final BlocForItem name;
  final BlocForItem description;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
  final File? file;

  const ProfCategoryUpdateState(
      {this.id = 0,
      this.name = const BlocForItem(error: 'ingresa el nombre'),
      this.description = const BlocForItem(error: 'ingresa la descripcion'),
      this.file,
      this.formKey,
      this.response});

  tocategory() => Category(name: name.value, description: description.value);

  ProfCategoryUpdateState restForm() {
    return ProfCategoryUpdateState(file: null);
  }

  ProfCategoryUpdateState copyWith(
      {int? id,
      BlocForItem? name,
      BlocForItem? description,
      GlobalKey<FormState>? formKey,
      Resource? response,
      File? file}) {
    return ProfCategoryUpdateState(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        file: file ?? this.file,
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, description, file, response];
}
