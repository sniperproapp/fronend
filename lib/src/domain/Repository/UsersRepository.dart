import 'dart:io';

import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

abstract class UsersRepository {
  Future<Resource<User>> update(int id, User user, File? image);
  Future<Resource<List<User>>> getUser(String busqueda);
  Future<Resource<bool>> inactivateuser(int id);
  Future<Resource<bool>> activate(int id);
  Future<Resource<bool>> descargo(int id);
}
