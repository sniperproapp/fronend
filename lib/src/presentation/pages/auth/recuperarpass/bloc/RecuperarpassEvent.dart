import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';

abstract class RecuperarpassEvent extends Equatable {
  const RecuperarpassEvent();
  @override
  List<Object?> get props => [];
}

class RecuperarpassEmailChanged extends RecuperarpassEvent {
  final BlocForItem email;
  const RecuperarpassEmailChanged({required this.email});
  @override
  List<Object?> get props => [email];
}

class RecuperarpassFormSubmit extends RecuperarpassEvent {
  const RecuperarpassFormSubmit();
}

class RecuperarpassFormReset extends RecuperarpassEvent {
  const RecuperarpassFormReset();
}
