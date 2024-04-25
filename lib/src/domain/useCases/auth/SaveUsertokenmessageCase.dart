import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';

class SaveUsertokenmessageCase {
  AuthRepository authRepository;
  SaveUsertokenmessageCase(this.authRepository);

  run(String token) => authRepository.saveUsertokenmessage(token);
}
