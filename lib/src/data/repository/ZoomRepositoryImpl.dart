import 'dart:io';

import 'package:sniper_pro/src/data/dataSource/remote/services/ZoomServices.dart';
import 'package:sniper_pro/src/domain/Repository/ZoomRepository.dart';
import 'package:sniper_pro/src/domain/models/Zoom.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ZoomRepositoryImpl implements ZoomRepository {
  ZoomServices zoomServices;

  ZoomRepositoryImpl(this.zoomServices);

  @override
  Future<Resource<List<Zoom>>> getZoom() {
    return zoomServices.getZoom();
  }

  @override
  Future<Resource<Zoom>> update(int id, Zoom zoom, File? file) {
    if (file == null) {
      return zoomServices.update(id, zoom);
    } else {
      return zoomServices.updateimage(id, zoom, file);
    }
  }
}
