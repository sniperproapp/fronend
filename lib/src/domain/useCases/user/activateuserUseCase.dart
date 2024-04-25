import 'package:sniper_pro/src/domain/Repository/UsersRepository.dart';

class activateuserUseCase {
  UsersRepository usersRepository;
  activateuserUseCase(this.usersRepository);

  run(int id) => usersRepository.activate(id);
}
