import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/update/bloc/ProfProductUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/update/bloc/ProfProductUpdateState.dart';

class ProfProductUpdateBloc
    extends Bloc<ProfProductUpdateEvent, ProfProductUpdateState> {
  ProductsUseCase productsUseCase;
  ProfProductUpdateBloc(this.productsUseCase)
      : super(ProfProductUpdateState()) {
    on<ProfProductUpdateInitEvent>(_onInitevEvent);
    on<NameChanged>(_onNameChanged);

    on<DescriptionChanged>(_ondescriptionChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    on<CompventaChanged>(_onCompventaChanged);
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
    on<ProductUpdateTakePhoto>(_onProductUpdateTakePhoto);
    on<ProductUpdatePickImage>(_onProductUpdatePickImage);
  }
  final formKey = GlobalKey<FormState>();
  final List<int> imagesToUpdate = <int>[];

  Future<void> _onInitevEvent(ProfProductUpdateInitEvent event,
      Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        idproduct: event.product?.id,
        name: BlocForItem(value: event.product?.name ?? ''),
        iduser: event.product?.iduser,
        description: BlocForItem(value: event.product?.description ?? ''),
        price: BlocForItem(value: event.product?.price.toString() ?? ''),
        price1: BlocForItem(value: event.product?.price1.toString() ?? ''),
        price2: BlocForItem(value: event.product?.price2.toString() ?? ''),
        sl: BlocForItem(value: event.product?.sl.toString() ?? ''),
        tp1: BlocForItem(value: event.product?.tp1.toString() ?? ''),
        tp2: BlocForItem(value: event.product?.tp2.toString() ?? ''),
        tp3: BlocForItem(value: event.product?.tp3.toString() ?? ''),
        tp4: BlocForItem(value: event.product?.tp4.toString() ?? ''),
        tp5: BlocForItem(value: event.product?.tp5.toString() ?? ''),
        estad: BlocForItem(value: event.product!.estad!),
        compventa: BlocForItem(value: event.product!.compventa),
        idcategory: event.product?.idCategory,
        formKey: formKey));
  }

  Future<void> _onNameChanged(
      NameChanged event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        name: BlocForItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _onpriceChanged(
      PriceChanged event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        price: BlocForItem(
            value: event.price.value,
            error: event.price.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _ondescriptionChanged(
      DescriptionChanged event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        description: BlocForItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<ProfProductUpdateState> emit) async {
    imagesToUpdate.clear();
    emit(state.copyWith(response: Loading(), formKey: formKey));

    List<File> files = [];
    // if (state.file1 != null) {
    //   imagesToUpdate.add(0);
    //   files.add(state.file1!);
    // }

    if (state.file2 != null) {
      imagesToUpdate.add(1);

      files.add(state.file2!);
    }

    Resource response = await productsUseCase.update.run(
        state.idproduct,
        state.toProduct(),
        files.isNotEmpty ? files : null,
        imagesToUpdate.isNotEmpty ? imagesToUpdate : null);

    emit(state.copyWith(
        response: response, formKey: formKey, imagetoupdate: imagesToUpdate));
  }

  Future<void> _onResetForm(
      ResetForm event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.restForm());
  }

  Future<void> _onProductUpdatePickImage(ProductUpdatePickImage event,
      Emitter<ProfProductUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (event.numberfile == 1) {
        // emit(state.copyWith(file1: File(image.path), formKey: formKey));
      } else if (event.numberfile == 2) {
        emit(state.copyWith(file2: File(image.path), formKey: formKey));
      }
    }
  }

  Future<void> _onCompventaChanged(
      CompventaChanged event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        compventa: BlocForItem(
            value: event.compventa.value,
            error:
                event.compventa.value.isNotEmpty ? null : 'ingrese el nombre '),
        formKey: formKey));
  }

  Future<void> _onProductUpdateTakePhoto(ProductUpdateTakePhoto event,
      Emitter<ProfProductUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      if (event.numberfile == 1) {
        imagesToUpdate.add(0);

        // emit(state.copyWith(file1: File(image.path), formKey: formKey));
      } else if (event.numberfile == 2) {
        imagesToUpdate.add(1);

        emit(state.copyWith(file2: File(image.path), formKey: formKey));
      }
    }
  }

  Future<void> _onprice1Changed(
      Price1Changed event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        price1: BlocForItem(
            value: event.price1.value,
            error: event.price1.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onprice2Changed(
      Price2Changed event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        price2: BlocForItem(
            value: event.price2.value,
            error: event.price2.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onSlChanged(
      SlChanged event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        sl: BlocForItem(
            value: event.sl.value,
            error: event.sl.value.isNotEmpty
                ? null
                : event.sl.value == ''
                    ? 'ingrese el precio '
                    : null),
        formKey: formKey));
  }

  Future<void> _onTp1Changed(
      Tp1Changed event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        tp1: BlocForItem(
            value: event.tp1.value,
            error: event.tp1.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onTp2Changed(
      Tp2Changed event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        tp2: BlocForItem(
            value: event.tp2.value,
            error: event.tp2.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onTp3Changed(
      Tp3Changed event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        tp3: BlocForItem(
            value: event.tp3.value,
            error: event.tp3.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onTp4Changed(
      Tp4Changed event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        tp4: BlocForItem(
            value: event.tp4.value,
            error: event.tp4.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onTp5Changed(
      Tp5Changed event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        tp5: BlocForItem(
            value: event.tp5.value,
            error: event.tp5.value.isNotEmpty ? null : 'ingrese el precio '),
        formKey: formKey));
  }

  Future<void> _onestadchage(
      EstadChanged event, Emitter<ProfProductUpdateState> emit) async {
    emit(state.copyWith(
        estad: BlocForItem(
            value: event.estad.value,
            error: event.estad.value.isNotEmpty ? null : 'ingrese el estado '),
        formKey: formKey));
  }
}
