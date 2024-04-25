import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/User.dart';

class AdminHomeState extends Equatable {
  final int pageIndex;
  final User? user;
  const AdminHomeState({this.pageIndex = 0, this.user});

  AdminHomeState copyWith({int? pageIndex, User? user}) {
    return AdminHomeState(
        pageIndex: pageIndex ?? this.pageIndex, user: user ?? this.user);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [pageIndex, user];
}
