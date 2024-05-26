import 'package:equatable/equatable.dart';

abstract class AdminZoomListEvent extends Equatable {
  const AdminZoomListEvent();

  @override
  List<Object?> get props => [];
}

class Getzoom extends AdminZoomListEvent {
  const Getzoom();
}

class Deletezoom extends AdminZoomListEvent {
  final int id;
  const Deletezoom({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
