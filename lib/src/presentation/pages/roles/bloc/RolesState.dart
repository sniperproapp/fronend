import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/Rol.dart';
import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class RolesState extends Equatable {
  final List<Role?>? roles;
  final User? user;
  final Resource? response;

  const RolesState({this.roles, this.user, this.response});

  RolesState copyWith({List<Role?>? roles, User? user, Resource? response}) {
    return RolesState(roles: roles, user: user, response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [roles, user, response];
}
