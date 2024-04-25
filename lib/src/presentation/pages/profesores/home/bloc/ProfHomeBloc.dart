import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/home/bloc/ProfHomeEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/home/bloc/ProfHomeState.dart';

class ProfHomeBloc extends Bloc<ProfHomeEvent, ProfHomeState> {
  AuthUseCases authUseCases;

  ProfHomeBloc(this.authUseCases) : super(ProfHomeState()) {
    on<ProfChangeDrawerPage>(_onProfChangeDrawerPage);
    on<ProfInfoGetUser>(_ongetuser);
    on<ProfLogout>(_onProfLogout);
  }

  Future<void> _onProfChangeDrawerPage(
      ProfChangeDrawerPage event, Emitter<ProfHomeState> emit) async {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }

  Future<void> _ongetuser(
      ProfInfoGetUser event, Emitter<ProfHomeState> emit) async {
    AuthResponse authResponse = await authUseCases.getusersession.rum();

    emit(state.copyWith(user: authResponse.user, pageIndex: 0));
    print(authResponse.user.name);
  }

  Future<void> _onProfLogout(
      ProfLogout event, Emitter<ProfHomeState> emit) async {
    await authUseCases.logout.run();
  }
}
