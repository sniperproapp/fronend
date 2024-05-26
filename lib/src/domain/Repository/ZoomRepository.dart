import 'dart:io';

import 'package:sniper_pro/src/domain/models/Zoom.dart';

import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

abstract class ZoomRepository {
  Future<Resource<List<Zoom>>> getZoom();
  Future<Resource<Zoom>> update(int id, Zoom zoom, File? file);
}
