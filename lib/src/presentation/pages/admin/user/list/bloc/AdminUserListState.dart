import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class AdminUserListState extends Equatable {
  final Resource? response;

  const AdminUserListState({this.response});

  AdminUserListState copyWith({Resource? response}) {
    return AdminUserListState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}
