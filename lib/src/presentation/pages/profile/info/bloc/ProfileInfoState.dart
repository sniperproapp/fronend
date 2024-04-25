import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/User.dart';

class ProfileInfoState extends Equatable {
  final User? user;

  const ProfileInfoState({this.user});
  ProfileInfoState copyWith({User? user}) {
    return ProfileInfoState(user: user);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
