import 'package:sniper_pro/src/domain/Repository/VideoRepository.dart';

class GetVideoUseCase {
  VideoRepository videoRepository;
  GetVideoUseCase(this.videoRepository);

  run() => videoRepository.getvideo();
}
