import 'dart:io';

import 'package:sniper_pro/src/domain/Repository/UsersRepository.dart';
import 'package:sniper_pro/src/domain/models/User.dart';

class UpdateUserUseCase {
  UsersRepository usersRepository;
  UpdateUserUseCase(this.usersRepository);
  run(int id, User user, File? image) =>
      usersRepository.update(id, user, image);
}
