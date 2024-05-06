import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/roles/bloc/RolesEvent.dart';
import 'package:sniper_pro/src/presentation/pages/roles/bloc/RolesState.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  AuthUseCases authUseCases;
  RolesBloc(this.authUseCases) : super(RolesState()) {
    on<GetRolesList>(_ongetroleslist);
    on<Getusermensaje>(_onGetusermensaje);
  }

  Future<void> _ongetroleslist(
      GetRolesList event, Emitter<RolesState> emit) async {
    AuthResponse? authResponse = await authUseCases.getusersession.rum();
    Resource<AuthResponse> response =
        await authUseCases.loginid.run(authResponse!.user.id!);

    emit(state.copyWith(
        roles: authResponse?.user.roles,
        user: authResponse?.user,
        response: response));
  }

  Future<void> _onGetusermensaje(
      Getusermensaje event, Emitter<RolesState> emit) async {
    Fluttertoast.showToast(
        msg: event.id!.toString(), toastLength: Toast.LENGTH_LONG);
  }
}
