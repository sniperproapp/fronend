import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';

abstract class clientZoomEvent extends Equatable {
  const clientZoomEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Getzoom extends clientZoomEvent {
  const Getzoom();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
