import 'package:equatable/equatable.dart';

class ProfileInfoEvent extends Equatable {
  const ProfileInfoEvent();

  @override
  List<Object?> get props => [];
}

class ProfileInfoGetUser extends ProfileInfoEvent {
  const ProfileInfoGetUser();
}
