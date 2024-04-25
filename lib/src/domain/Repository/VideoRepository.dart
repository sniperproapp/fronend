import 'package:sniper_pro/src/domain/models/video.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

abstract class VideoRepository {
  Future<Resource<List<Video>>> getvideo();
}
