import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';

class GetCategorySessionUserCase {
  AuthRepository authRepository;
  GetCategorySessionUserCase(this.authRepository);

  rum() => authRepository.getcategorySession();
}
