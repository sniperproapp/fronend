import 'package:sniper_pro/src/domain/Repository/UsersRepository.dart';

class descargoUseCase {
  UsersRepository usersRepository;
  descargoUseCase(this.usersRepository);

  run(int id) => usersRepository.descargo(id);
}
