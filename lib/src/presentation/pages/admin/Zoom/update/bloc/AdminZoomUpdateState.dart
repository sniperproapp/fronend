import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/Zoom.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class AdminZoomUpdateState extends Equatable {
  final int id;
  final BlocForItem name;
  final BlocForItem link;
  final BlocForItem description;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
  final File? file;

  const AdminZoomUpdateState(
      {this.id = 0,
      this.name = const BlocForItem(error: 'ingresa el nombre'),
      this.link = const BlocForItem(error: 'ingresa el link'),
      this.description = const BlocForItem(error: 'ingresa la descripcion'),
      this.file,
      this.formKey,
      this.response});

  toZoom() =>
      Zoom(name: name.value, description: description.value, link: link.value);

  AdminZoomUpdateState restForm() {
    return AdminZoomUpdateState(file: null);
  }

  AdminZoomUpdateState copyWith(
      {int? id,
      BlocForItem? name,
      BlocForItem? link,
      BlocForItem? description,
      GlobalKey<FormState>? formKey,
      Resource? response,
      File? file}) {
    return AdminZoomUpdateState(
        id: id ?? this.id,
        name: name ?? this.name,
        link: link ?? this.link,
        description: description ?? this.description,
        file: file ?? this.file,
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, description, file, link, response];
}
