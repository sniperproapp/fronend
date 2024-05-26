import 'package:sniper_pro/src/domain/useCases/zoom/GetZoomUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/zoom/UpdateZoomUseCase.dart';

class ZoomUseCases {
  GetZoomUseCase getzoom;
  UpdateZoomUseCase update;

  ZoomUseCases({
    required this.getzoom,
    required this.update,
  });
}
