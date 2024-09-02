import 'package:sniper_pro/src/domain/Repository/UsersRepository.dart';

class activateuserUseCase {
  UsersRepository usersRepository;
  activateuserUseCase(this.usersRepository);

  run(int id, String timeLimit) => usersRepository.activate(id, timeLimit);
}
