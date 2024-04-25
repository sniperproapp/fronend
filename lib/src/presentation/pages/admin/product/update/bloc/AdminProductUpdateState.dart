import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';

import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class AdminProductUpdateState extends Equatable {
  final BlocForItem name;
  final int idcategory;
  final int iduser;
  final int idproduct;
  final BlocForItem price;
  final BlocForItem estad;
  final BlocForItem price1;
  final BlocForItem price2;
  final BlocForItem sl;
  final BlocForItem tp1;
  final BlocForItem tp2;
  final BlocForItem tp3;
  final BlocForItem tp4;
  final BlocForItem compventa;
  final BlocForItem tp5;
  final BlocForItem description;
  final GlobalKey<FormState>? formKey;
  final List<int>? imagetoupdate;
  final Resource? response;
  final File? file1;
  final File? file2;

  const AdminProductUpdateState(
      {this.idproduct = 0,
      this.name = const BlocForItem(error: 'ingresa el nombre'),
      this.description = const BlocForItem(error: 'ingresa la descripcion'),
      this.price = const BlocForItem(error: 'ingresa el precio'),
      this.compventa = const BlocForItem(error: 'ingresa la compra o venta'),
      this.price1 = const BlocForItem(error: 'ingresa el precio'),
      this.price2 = const BlocForItem(error: 'ingresa el precio2'),
      this.sl = const BlocForItem(error: 'ingresa el sl'),
      this.tp1 = const BlocForItem(error: 'ingresa el tp'),
      this.tp2 = const BlocForItem(error: 'ingresa el tp'),
      this.tp3 = const BlocForItem(error: 'ingresa el tp'),
      this.tp4 = const BlocForItem(error: 'ingresa el tp'),
      this.tp5 = const BlocForItem(error: 'ingresa el tp'),
      this.idcategory = 0,
      this.estad = const BlocForItem(error: 'ingresa el estado'),
      this.iduser = 0,
      this.file1,
      this.file2,
      this.imagetoupdate,
      this.formKey,
      this.response});

  toProduct() => Product(
        id: idproduct,
        name: name.value,
        price: double.parse(price.value),
        price2: double.parse(price2.value),
        price1: double.parse(price1.value),
        description: description.value,
        idCategory: idcategory,
        sl: double.parse(sl.value),
        iduser: iduser,
        estad: estad.value,
        compventa: compventa.value,
        tp1: double.parse(tp1.value),
        tp2: double.parse(tp2.value),
        tp3: double.parse(tp3.value),
        tp4: double.parse(tp4.value),
        tp5: double.parse(tp5.value),
      );

  AdminProductUpdateState restForm() {
    return AdminProductUpdateState(file2: null);
  }

  AdminProductUpdateState copyWith(
      {BlocForItem? name,
      int? idcategory,
      int? iduser,
      List<int>? imagetoupdate,
      int? idproduct,
      BlocForItem? description,
      BlocForItem? compventa,
      BlocForItem? estad,
      BlocForItem? price,
      BlocForItem? price1,
      BlocForItem? price2,
      BlocForItem? sl,
      BlocForItem? tp1,
      BlocForItem? tp2,
      BlocForItem? tp3,
      BlocForItem? tp4,
      BlocForItem? tp5,
      GlobalKey<FormState>? formKey,
      Resource? response,
      File? file1,
      File? file2}) {
    return AdminProductUpdateState(
        idcategory: idcategory ?? this.idcategory,
        iduser: iduser ?? this.iduser,
        estad: estad ?? this.estad,
        name: name ?? this.name,
        imagetoupdate: imagetoupdate ?? this.imagetoupdate,
        idproduct: idproduct ?? this.idproduct,
        price1: price1 ?? this.price1,
        price2: price2 ?? this.price2,
        sl: sl ?? this.sl,
        tp1: tp1 ?? this.tp1,
        tp2: tp2 ?? this.tp2,
        tp3: tp3 ?? this.tp3,
        tp4: tp4 ?? this.tp4,
        tp5: tp5 ?? this.tp5,
        description: description ?? this.description,
        compventa: compventa ?? this.compventa,
        price: price ?? this.price,
        file1: file1 ?? this.file1,
        file2: file2 ?? this.file2,
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        idproduct,
        imagetoupdate,
        idcategory,
        iduser,
        name,
        estad,
        price,
        price1,
        price2,
        sl,
        tp1,
        tp2,
        tp3,
        tp4,
        tp5,
        compventa,
        description,
        file1,
        file2,
        response
      ];
}
