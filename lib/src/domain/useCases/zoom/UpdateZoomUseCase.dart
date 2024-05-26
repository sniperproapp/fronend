import 'dart:io';

import 'package:sniper_pro/src/domain/Repository/ZoomRepository.dart';
import 'package:sniper_pro/src/domain/models/Zoom.dart';

class UpdateZoomUseCase {
  ZoomRepository zoomRepository;
  UpdateZoomUseCase(this.zoomRepository);

  run(int id, Zoom zoom, File? file) => zoomRepository.update(id, zoom, file);
}
