import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';

class RecuperarpassUseCase {
  AuthRepository repository;
  RecuperarpassUseCase(this.repository);

  run(String email) => repository.recuperarpass(email);
}
