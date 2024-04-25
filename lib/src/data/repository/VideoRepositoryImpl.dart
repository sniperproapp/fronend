import 'package:sniper_pro/src/data/dataSource/remote/services/VideoServices.dart';
import 'package:sniper_pro/src/domain/Repository/VideoRepository.dart';
import 'package:sniper_pro/src/domain/models/video.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class VideoRepositoryImpl implements VideoRepository {
  VideoServices videoServices;

  VideoRepositoryImpl(this.videoServices);

  @override
  @override
  Future<Resource<List<Video>>> getvideo() {
    return videoServices.getUser();
  }
}
