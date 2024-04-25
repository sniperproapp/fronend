import 'package:sniper_pro/src/domain/Repository/UsersRepository.dart';

class GetUsersUseCase {
  UsersRepository usersRepository;
  GetUsersUseCase(this.usersRepository);

  run(String busqueda) => usersRepository.getUser(busqueda);
}
