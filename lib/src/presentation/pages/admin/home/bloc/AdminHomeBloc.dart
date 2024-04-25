import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent, AdminHomeState> {
  AuthUseCases authUseCases;

  AdminHomeBloc(this.authUseCases) : super(AdminHomeState()) {
    on<AdminChangeDrawerPage>(_onAdminChangeDrawerPage);
    on<AdminLogout>(_onAdminLogout);
    on<adminProfInfoGetUser>(_ongetuser);
  }

  Future<void> _onAdminChangeDrawerPage(
      AdminChangeDrawerPage event, Emitter<AdminHomeState> emit) async {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }

  Future<void> _ongetuser(
      adminProfInfoGetUser event, Emitter<AdminHomeState> emit) async {
    AuthResponse authResponse = await authUseCases.getusersession.rum();

    emit(state.copyWith(user: authResponse.user, pageIndex: 0));
    print(authResponse.user.name);
  }

  Future<void> _onAdminLogout(
      AdminLogout event, Emitter<AdminHomeState> emit) async {
    await authUseCases.logout.run();
  }
}
