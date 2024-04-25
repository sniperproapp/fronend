import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/create/bloc/ProfProductCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/create/bloc/ProfProductCreateState.dart';

class ProfProductCreateBloc
    extends Bloc<ProfProductCreateEvent, ProfProductCreateState> {
  ProductsUseCase peoductsUseCase;
  AuthUseCases authUseCases;
  ProfProductCreateBloc(this.peoductsUseCase, this.authUseCases)
      : super(ProfProductCreateState()) {
    on<ProfProductInitEvent>(_onInitevEvent);

    on<NameChanged>(_onNameChanged);
    on<EstadChanged>(_onestadchage);
    on<PriceChanged>(_onpriceChanged);
    on<Price1Changed>(_onprice1Changed);
    on<Price2Changed>(_onprice2Changed);
    on<SlChanged>(_onSlChanged);
    on<Tp1Changed>(_onTp1Changed);
    on<Tp2Changed>(_onTp2Changed);
    on<Tp3Changed>(_onTp3Changed);
    on<Tp4Changed>(_onTp4Changed);
    on<Tp5Changed>(_onTp5Changed);
    on<DescriptionChanged>(_ondescriptionChanged);
    on<CompventaChanged>(_onCompventaChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    on<ProductUpdateTakePhoto>(_onProductUpdateTakePhoto);
    on<ProductUpdatePickImage>(_onProductUpdatePickImage);
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitevEvent(
      ProfProductInitEvent event, Emitter<ProfProductCreateState> emit) async {
    String compraventaaux = 'BUY';
    AuthResponse authResponse = await authUseCases.getusersession.rum();

    if (event.category!.name[0] == 'B' || event.category!.name[0] == 'b') {
      compraventaaux = 'BUY';
    } else {
      compraventaaux = 'SELL';
    }
    emit(state.copyWith(
        idcategory: event.category?.id,
        iduser: authResponse.user.id,
        name: BlocForItem(value: event.category!.name),
        compventa: BlocForItem(value: compraventaaux),
        estad: BlocForItem(value: 'ACTIVO'),
        image1: authResponse.user.imagen!,
        formKey: formKey));
  }

  Future<void> _onNameChanged(
      NameChanged event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        name: BlocForItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _onestadchage(
      EstadChanged event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        estad: BlocForItem(
            value: event.estad.value,
            error: event.estad.value.isNotEmpty ? null : 'ingrese el estado '),
        formKey: formKey));
  }

  Future<void> _onpriceChanged(
      PriceChanged event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        price: BlocForItem(
            value: event.price.value,
            error: event.price.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onprice1Changed(
      Price1Changed event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        price1: BlocForItem(
            value: event.price1.value,
            error: event.price1.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onprice2Changed(
      Price2Changed event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        price2: BlocForItem(
            value: event.price2.value,
            error: event.price2.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onSlChanged(
      SlChanged event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        sl: BlocForItem(
            value: event.sl.value,
            error: event.sl.value.isNotEmpty
                ? null
                : event.sl.value == ''
                    ? 'ingrese el sl '
                    : null),
        formKey: formKey));
  }

  Future<void> _onTp1Changed(
      Tp1Changed event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        tp1: BlocForItem(
            value: event.tp1.value,
            error: event.tp1.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onTp2Changed(
      Tp2Changed event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        tp2: BlocForItem(
            value: event.tp2.value,
            error: event.tp2.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onTp3Changed(
      Tp3Changed event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        tp3: BlocForItem(
            value: event.tp3.value,
            error: event.tp3.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onTp4Changed(
      Tp4Changed event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        tp4: BlocForItem(
            value: event.tp4.value,
            error: event.tp4.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onTp5Changed(
      Tp5Changed event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        tp5: BlocForItem(
            value: event.tp5.value,
            error: event.tp5.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _ondescriptionChanged(
      DescriptionChanged event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        description: BlocForItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _onCompventaChanged(
      CompventaChanged event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(
        compventa: BlocForItem(
            value: event.compventa.value,
            error:
                event.compventa.value.isNotEmpty ? null : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<ProfProductCreateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    if (state.file2 != null) {
      List<File> files = [state.file2!];
      Resource response =
          await peoductsUseCase.create.run(state.toProduct(), files);
      emit(state.copyWith(response: response, formKey: formKey));
    } else {
      emit(state.copyWith(
          response: Error('seleciona la imagen'), formKey: formKey));
    }
  }

  Future<void> _onResetForm(
      ResetForm event, Emitter<ProfProductCreateState> emit) async {
    emit(state.restForm());

    // emit(state.copyWith(file: null));
  }

  Future<void> _onProductUpdatePickImage(ProductUpdatePickImage event,
      Emitter<ProfProductCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (event.numberfile == 1) {
        //emit(state.copyWith(file1: File(image.path), formKey: formKey));
      } else if (event.numberfile == 2) {
        emit(state.copyWith(file2: File(image.path), formKey: formKey));
      }
    }
  }

  Future<void> _onProductUpdateTakePhoto(ProductUpdateTakePhoto event,
      Emitter<ProfProductCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      if (event.numberfile == 1) {
        // emit(state.copyWith(file1: File(image.path), formKey: formKey));
      } else if (event.numberfile == 2) {
        emit(state.copyWith(file2: File(image.path), formKey: formKey));
      }
    }
  }
}
