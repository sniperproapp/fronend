import 'package:sniper_pro/src/domain/Repository/UsersRepository.dart';

class inactivateuserUseCase {
  UsersRepository usersRepository;
  inactivateuserUseCase(this.usersRepository);

  run(int id) => usersRepository.inactivateuser(id);
}
