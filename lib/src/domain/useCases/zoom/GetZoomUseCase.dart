import 'package:sniper_pro/src/domain/Repository/ZoomRepository.dart';

class GetZoomUseCase {
  ZoomRepository zoomRepository;
  GetZoomUseCase(this.zoomRepository);

  run() => zoomRepository.getZoom();
}
