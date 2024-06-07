import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/useCases/user/UsersUseCases.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/bloc/AdminUserListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/bloc/AdminUserListState.dart';

class AdminUserListBloc extends Bloc<AdminUserListEvent, AdminUserListState> {
  UsersUseCases useCases;

  AdminUserListBloc(this.useCases) : super(AdminUserListState()) {
    on<Getuser>(_ongetuser);
    on<Inactivateuser>(_onInactivateuser);
    on<activateuser>(_onactivate);
    on<deactivatalleuser>(_ondeactivatalleuser);
  }

  Future<void> _ongetuser(
      Getuser event, Emitter<AdminUserListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await useCases.getuser.run(event.busqueda);

    emit(state.copyWith(response: response));
  }

  Future<void> _onactivate(
      activateuser event, Emitter<AdminUserListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await useCases.activate.run(event.id);

    emit(state.copyWith(response: response));
  }

  Future<void> _onInactivateuser(
      Inactivateuser event, Emitter<AdminUserListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await useCases.inactivate.run(event.id);

    emit(state.copyWith(response: response));
  }

  Future<void> _ondeactivatalleuser(
      deactivatalleuser event, Emitter<AdminUserListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await useCases.desactivateall.run();

    emit(state.copyWith(response: response));
  }
}
