import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';

class LoginidUseCase {
  AuthRepository repository;
  LoginidUseCase(this.repository);

  run(int id) => repository.loginid(id);
}
