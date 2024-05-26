import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sniper_pro/src/domain/useCases/video/VideoUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/zoom/ZoomUseCases.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

import 'package:sniper_pro/src/presentation/pages/client/zoom/bloc/clientZoomEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/zoom/bloc/clientZoomState.dart';

class clientZoomBloc extends Bloc<clientZoomEvent, clientZoomState> {
  ZoomUseCases zoomUseCases;
  clientZoomBloc(this.zoomUseCases) : super(clientZoomState()) {
    on<Getzoom>(_ongetzoom);
  }
  Future<void> _ongetzoom(Getzoom event, Emitter<clientZoomState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await zoomUseCases.getzoom.run();

    emit(state.copyWith(response: response));
  }
}
