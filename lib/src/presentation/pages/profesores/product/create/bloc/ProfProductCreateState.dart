import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';

import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ProfProductCreateState extends Equatable {
  final BlocForItem name;
  final int idcategory;
  final int iduser;
  final BlocForItem price;
  final BlocForItem? price1;
  final BlocForItem? price2;
  final BlocForItem? sl;
  final BlocForItem? tp1;
  final BlocForItem? tp2;
  final BlocForItem? tp3;
  final BlocForItem? tp4;
  final BlocForItem? tp5;
  final BlocForItem estad;
  final BlocForItem? description;
  final BlocForItem compventa;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
  final String? image1;
  final File? file2;

  const ProfProductCreateState(
      {this.name = const BlocForItem(error: 'ingresa el nombre'),
      this.description = const BlocForItem(error: 'ingresa la descripcion'),
      this.compventa = const BlocForItem(error: 'ingresa la compra o venta'),
      this.price = const BlocForItem(error: 'ingresa el precio'),
      this.price1 = const BlocForItem(value: '0', error: 'ingresa el precio'),
      this.price2 = const BlocForItem(value: '0', error: 'ingresa el precio'),
      this.sl = const BlocForItem(error: 'ingresa el sl'),
      this.tp1 = const BlocForItem(value: '0', error: 'ingresa el tp'),
      this.tp2 = const BlocForItem(value: '0', error: 'ingresa el tp'),
      this.tp3 = const BlocForItem(value: '0', error: 'ingresa el tp'),
      this.tp4 = const BlocForItem(value: '0', error: 'ingresa el tp'),
      this.tp5 = const BlocForItem(value: '0', error: 'ingresa el tp'),
      this.estad = const BlocForItem(error: 'ingresa el estado'),
      this.idcategory = 0,
      this.iduser = 0,
      this.image1,
      this.file2,
      this.formKey,
      this.response});

  toProduct() => Product(
        name: name.value,
        estad: estad.value,
        price: double.parse(price.value),
        description: description!.value,
        idCategory: idcategory,
        iduser: iduser,
        image1: image1,
        compventa: compventa.value,
        price1: double.parse(price1!.value),
        price2: double.parse(price1!.value),
        sl: double.parse(sl!.value),
        tp1: double.parse(tp1!.value),
        tp2: double.parse(tp2!.value),
        tp3: double.parse(tp3!.value),
        tp4: double.parse(tp4!.value),
        tp5: double.parse(tp5!.value),
      );
  ProfProductCreateState restForm() {
    return ProfProductCreateState(
      name: name,
      compventa: compventa,
      price: const BlocForItem(error: 'ingresa el precio'),
      price1: const BlocForItem(value: '0', error: 'ingresa el precio'),
      price2: const BlocForItem(value: '0', error: 'ingresa el precio'),
      sl: const BlocForItem(error: 'ingresa el sl'),
      tp1: const BlocForItem(value: '0', error: 'ingresa el tp'),
      tp2: const BlocForItem(value: '0', error: 'ingresa el tp'),
      tp3: const BlocForItem(value: '0', error: 'ingresa el tp'),
      tp4: const BlocForItem(value: '0', error: 'ingresa el tp'),
      tp5: const BlocForItem(value: '0', error: 'ingresa el tp'),
      estad: estad,
      iduser: iduser,
      image1: image1,
      idcategory: idcategory,
      description: const BlocForItem(error: 'ingresa la descripcion'),
    );
  }

  ProfProductCreateState copyWith(
      {BlocForItem? name,
      int? idcategory,
      BlocForItem? estad,
      int? iduser,
      BlocForItem? description,
      BlocForItem? compventa,
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
      String? image1,
      File? file2}) {
    return ProfProductCreateState(
        idcategory: idcategory ?? this.idcategory,
        iduser: iduser ?? this.iduser,
        name: name ?? this.name,
        estad: estad ?? this.estad,
        price: price ?? this.price,
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
        image1: image1 ?? this.image1,
        file2: file2 ?? this.file2,
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        idcategory,
        name,
        price,
        estad,
        price1,
        price2,
        sl,
        tp1,
        tp2,
        tp3,
        tp4,
        iduser,
        tp5,
        compventa,
        description,
        image1,
        file2,
        response
      ];
}
