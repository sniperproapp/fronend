import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeState.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  AuthUseCases authUseCases;
  ClientHomeBloc(this.authUseCases) : super(ClientHomeState()) {
    on<clientInfoGetUser>(_ongetuser);
    on<ChangeDrawerPage>(_onChangeDrawerPage);
    on<logout>(_onlogout);
  }

  Future<void> _onChangeDrawerPage(
      ChangeDrawerPage event, Emitter<ClientHomeState> emit) async {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }

  Future<void> _ongetuser(
      clientInfoGetUser event, Emitter<ClientHomeState> emit) async {
    AuthResponse authResponse = await authUseCases.getusersession.rum();

    emit(state.copyWith(
        user: authResponse.user,
        pageIndex: authResponse.user.descargo == 1 ? 0 : 5));
  }

  Future<void> _onlogout(logout event, Emitter<ClientHomeState> emit) async {
    await authUseCases.logout.run();
  }
}
