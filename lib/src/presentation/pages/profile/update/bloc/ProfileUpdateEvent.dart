import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';

abstract class ProfileUpdateEvent extends Equatable {
  const ProfileUpdateEvent();

  @override
  List<Object?> get props => [];
}

class ProfileUpdateInitEvent extends ProfileUpdateEvent {
  final User? user;
  ProfileUpdateInitEvent({required this.user});
  @override
  List<Object?> get props => [user];
}

class ProfileUpdateNameChange extends ProfileUpdateEvent {
  final BlocForItem name;
  const ProfileUpdateNameChange({required this.name});
  @override
  List<Object?> get props => [name];
}

class ProfileUpdatelastnameChange extends ProfileUpdateEvent {
  final BlocForItem lastname;
  const ProfileUpdatelastnameChange({required this.lastname});
  @override
  List<Object?> get props => [lastname];
}

class ProfileUpdatephoneChange extends ProfileUpdateEvent {
  final BlocForItem phone;
  const ProfileUpdatephoneChange({required this.phone});
  @override
  List<Object?> get props => [phone];
}

class profileupdateformsubmit extends ProfileUpdateEvent {
  const profileupdateformsubmit();
}

class ProfileUpdatePickImage extends ProfileUpdateEvent {
  const ProfileUpdatePickImage();
}

class ProfileUpdateTakePhoto extends ProfileUpdateEvent {
  const ProfileUpdateTakePhoto();
}

class ProfileUpdateUpdateUserSesion extends ProfileUpdateEvent {
  final User user;
  const ProfileUpdateUpdateUserSesion({required this.user});
  @override
  List<Object?> get props => [user];
}
