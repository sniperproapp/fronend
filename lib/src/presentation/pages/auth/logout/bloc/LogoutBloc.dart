import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/auth/logout/bloc/LogoutEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/logout/bloc/LogoutState.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  AuthUseCases authUseCases;
  LogoutBloc(this.authUseCases) : super(LogoutState()) {
    on<Logoutgeneral>(_onLogoutgeneral);
  }
  Future<void> _onLogoutgeneral(
      Logoutgeneral event, Emitter<LogoutState> emit) async {
    emit(state.copyWith(response: Loading()));
    await authUseCases.logout.run();
    await Future.delayed(Duration(seconds: 3));
    emit(state.copyWith(response: Success({})));
  }
}
