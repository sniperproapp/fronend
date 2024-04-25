import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';

class GetUserSessionUserCase {
  AuthRepository authRepository;
  GetUserSessionUserCase(this.authRepository);

  rum() => authRepository.getUserSession();
}
