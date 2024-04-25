import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/Rol.dart';

class RolesState extends Equatable {
  final List<Role?>? roles;

  const RolesState({this.roles});

  RolesState copyWith({List<Role?>? roles}) {
    return RolesState(roles: roles);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [roles];
}
