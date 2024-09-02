import 'package:equatable/equatable.dart';

abstract class AdminUserListEvent extends Equatable {
  const AdminUserListEvent();

  @override
  List<Object?> get props => [];
}

class Getuser extends AdminUserListEvent {
  final String busqueda;
  const Getuser({required this.busqueda});
  // TODO: implement props
  @override
  List<Object?> get props => [busqueda];
}

class Inactivateuser extends AdminUserListEvent {
  final int id;
  const Inactivateuser({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class activateuser extends AdminUserListEvent {
  final int id;
  final String timeLimit;
  const activateuser({required this.id, required this.timeLimit});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class deactivatalleuser extends AdminUserListEvent {
  const deactivatalleuser();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
