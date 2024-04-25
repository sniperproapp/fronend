import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';
import 'package:sniper_pro/src/domain/models/User.dart';

class RegisterUseCase {
  AuthRepository repository;
  RegisterUseCase(this.repository);
  run(User user) => repository.register(user);
}
