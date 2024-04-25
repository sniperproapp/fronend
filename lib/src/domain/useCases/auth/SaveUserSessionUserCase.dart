import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';

class SaveUserSessionUserCase {
  AuthRepository authRepository;
  SaveUserSessionUserCase(this.authRepository);

  run(AuthResponse authResponse) =>
      authRepository.saveUserSession(authResponse);
}
