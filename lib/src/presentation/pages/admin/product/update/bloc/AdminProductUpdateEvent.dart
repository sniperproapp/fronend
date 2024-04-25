import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';

abstract class AdminProductUpdateEvent extends Equatable {
  const AdminProductUpdateEvent();

  @override
  List<Object?> get props => [];
}

class AdminProductUpdateInitEvent extends AdminProductUpdateEvent {
  final Product? product;

  const AdminProductUpdateInitEvent({required this.product});
  @override
  List<Object?> get props => [product];
}

class NameChanged extends AdminProductUpdateEvent {
  final BlocForItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class PriceChanged extends AdminProductUpdateEvent {
  final BlocForItem price;
  const PriceChanged({required this.price});
  @override
  List<Object?> get props => [price];
}

class Price1Changed extends AdminProductUpdateEvent {
  final BlocForItem price1;
  const Price1Changed({required this.price1});
  @override
  List<Object?> get props => [price1];
}

class Price2Changed extends AdminProductUpdateEvent {
  final BlocForItem price2;
  const Price2Changed({required this.price2});
  @override
  List<Object?> get props => [price2];
}

class SlChanged extends AdminProductUpdateEvent {
  final BlocForItem sl;
  const SlChanged({required this.sl});
  @override
  List<Object?> get props => [sl];
}

class Tp1Changed extends AdminProductUpdateEvent {
  final BlocForItem tp1;
  const Tp1Changed({required this.tp1});
  @override
  List<Object?> get props => [tp1];
}

class Tp2Changed extends AdminProductUpdateEvent {
  final BlocForItem tp2;
  const Tp2Changed({required this.tp2});
  @override
  List<Object?> get props => [tp2];
}

class Tp3Changed extends AdminProductUpdateEvent {
  final BlocForItem tp3;
  const Tp3Changed({required this.tp3});
  @override
  List<Object?> get props => [tp3];
}

class Tp4Changed extends AdminProductUpdateEvent {
  final BlocForItem tp4;
  const Tp4Changed({required this.tp4});
  @override
  List<Object?> get props => [tp4];
}

class Tp5Changed extends AdminProductUpdateEvent {
  final BlocForItem tp5;
  const Tp5Changed({required this.tp5});
  @override
  List<Object?> get props => [tp5];
}

class CompventaChanged extends AdminProductUpdateEvent {
  final BlocForItem compventa;
  const CompventaChanged({required this.compventa});
  @override
  List<Object?> get props => [compventa];
}

class DescriptionChanged extends AdminProductUpdateEvent {
  final BlocForItem description;
  const DescriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class EstadChanged extends AdminProductUpdateEvent {
  final BlocForItem estad;
  const EstadChanged({required this.estad});
  @override
  List<Object?> get props => [estad];
}

class FormSubmit extends AdminProductUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminProductUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

class ProductUpdatePickImage extends AdminProductUpdateEvent {
  final int numberfile;
  const ProductUpdatePickImage({required this.numberfile});
}

class ProductUpdateTakePhoto extends AdminProductUpdateEvent {
  final int numberfile;
  const ProductUpdateTakePhoto({required this.numberfile});
}
