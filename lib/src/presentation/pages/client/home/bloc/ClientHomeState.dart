import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/User.dart';

class ClientHomeState extends Equatable {
  final int? pageIndex;
  final User? user;

  const ClientHomeState({this.pageIndex = 5, this.user});

  ClientHomeState copyWith({int? pageIndex, User? user}) {
    return ClientHomeState(pageIndex: pageIndex, user: user ?? this.user);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [pageIndex, user];
}
