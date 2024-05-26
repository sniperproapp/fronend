import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/useCases/Categories/CategoriesUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/zoom/ZoomUseCases.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/bloc/AdminZoomListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/bloc/AdminZoomListState.dart';

class AdminZoomListBloc extends Bloc<AdminZoomListEvent, AdminZoomListState> {
  ZoomUseCases zoomUseCase;

  AdminZoomListBloc(this.zoomUseCase) : super(AdminZoomListState()) {
    on<Getzoom>(_ongetzoom);
    on<Deletezoom>(_onDeleteZoom);
  }

  Future<void> _ongetzoom(
      Getzoom event, Emitter<AdminZoomListState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await zoomUseCase.getzoom.run();

    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteZoom(
      Deletezoom event, Emitter<AdminZoomListState> emit) async {
    emit(state.copyWith(response: Loading()));

    // Resource response = await zoomUseCase.delete.run(event.id);

    // emit(state.copyWith(response: response));
  }
}
