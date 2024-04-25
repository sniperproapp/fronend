import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/presentation/pages/roles/bloc/RolesEvent.dart';
import 'package:sniper_pro/src/presentation/pages/roles/bloc/RolesState.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  AuthUseCases authUseCases;
  RolesBloc(this.authUseCases) : super(RolesState()) {
    on<GetRolesList>(_ongetroleslist);
  }

  Future<void> _ongetroleslist(
      GetRolesList event, Emitter<RolesState> emit) async {
    AuthResponse? authResponse = await authUseCases.getusersession.rum();
    emit(state.copyWith(roles: authResponse?.user.roles));
  }
}
