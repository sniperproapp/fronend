import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';

class LoginUseCase {
  AuthRepository repository;
  LoginUseCase(this.repository);

  run(String email, String password) => repository.login(email, password);
}
