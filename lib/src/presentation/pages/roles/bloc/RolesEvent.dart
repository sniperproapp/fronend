import 'package:equatable/equatable.dart';

abstract class RolesEvent extends Equatable {
  const RolesEvent();
  @override
  List<Object?> get props => [];
}

class GetRolesList extends RolesEvent {
  const GetRolesList();
}

class Getusermensaje extends RolesEvent {
  final int? id;
  const Getusermensaje({this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
