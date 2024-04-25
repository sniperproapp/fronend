import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/video/VideoUseCases.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/bloc/clientvideoEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/bloc/clientvideoState.dart';

class clientvideoBloc extends Bloc<clientvideoEvent, clientvideoState> {
  VideoUseCases videoUseCases;
  clientvideoBloc(this.videoUseCases) : super(clientvideoState()) {
    on<Getvideo>(_ongetvideo);
  }
  Future<void> _ongetvideo(
      Getvideo event, Emitter<clientvideoState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await videoUseCases.getvideo.run();

    emit(state.copyWith(response: response));
  }
}
