import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';

class LogoutUseCase {
  AuthRepository repository;

  LogoutUseCase(this.repository);
  run() => repository.logout();
}
