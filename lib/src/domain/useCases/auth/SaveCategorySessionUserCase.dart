import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';

class SavecategorySessionUseCase {
  AuthRepository authRepository;
  SavecategorySessionUseCase(this.authRepository);

  run(List<Category> categoris) =>
      authRepository.saveCategorySession(categoris);
}
