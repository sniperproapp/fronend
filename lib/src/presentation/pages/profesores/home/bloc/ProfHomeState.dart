import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/User.dart';

class ProfHomeState extends Equatable {
  final int pageIndex;
  final User? user;

  const ProfHomeState({this.pageIndex = 0, this.user});

  ProfHomeState copyWith({int? pageIndex, User? user}) {
    return ProfHomeState(
        pageIndex: pageIndex ?? this.pageIndex, user: user ?? this.user);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [pageIndex, user];
}
