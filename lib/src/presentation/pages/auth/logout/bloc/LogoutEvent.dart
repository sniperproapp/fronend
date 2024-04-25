import 'package:equatable/equatable.dart';

abstract class LogoutEvent extends Equatable {
  const LogoutEvent();

  @override
  List<Object?> get props => [];
}

class Logoutgeneral extends LogoutEvent {
  const Logoutgeneral();
}
