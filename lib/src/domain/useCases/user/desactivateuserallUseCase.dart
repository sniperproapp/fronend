import 'package:sniper_pro/src/domain/Repository/UsersRepository.dart';

class desactivateuserallUseCase {
  UsersRepository usersRepository;
  desactivateuserallUseCase(this.usersRepository);

  run() => usersRepository.desactivateall();
}
