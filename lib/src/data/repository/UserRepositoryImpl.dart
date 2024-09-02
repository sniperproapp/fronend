import 'dart:io';

import 'package:sniper_pro/src/data/dataSource/remote/services/UserServices.dart';
import 'package:sniper_pro/src/domain/Repository/UsersRepository.dart';
import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class UserRepositoryImpl implements UsersRepository {
  UserServices userServices;

  UserRepositoryImpl(this.userServices);

  @override
  Future<Resource<User>> update(int id, User user, File? image) {
    if (image == null) {
      return userServices.update(id, user);
    } else {
      return userServices.updateimage(id, user, image);
    }
  }

  @override
  Future<Resource<List<User>>> getUser(String busqueda) {
    return userServices.getUser(busqueda);
  }

  @override
  Future<Resource<bool>> activate(int id, String timeLimit) {
    return userServices.updateactivate(id, timeLimit);
  }

  @override
  Future<Resource<bool>> descargo(int id) {
    return userServices.updatedescargo(id);
  }

  @override
  Future<Resource<bool>> inactivateuser(int id) {
    return userServices.updateinactivate(id);
  }

  @override
  Future<Resource<bool>> desactivateall() {
    return userServices.desactivateuserall();
  }
}
