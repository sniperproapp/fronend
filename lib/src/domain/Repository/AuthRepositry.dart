import 'dart:ffi';

import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/models/User.dart';

abstract class AuthRepository {
  Future<AuthResponse?> getUserSession();
  Future<List<Category>?> getcategorySession();
  Future<bool> logout();
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<void> saveCategorySession(List<Category> categoris);
  Future<void> saveUsertokenmessage(String token);
  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<bool>> recuperarpass(String email);

  Future<Resource<AuthResponse>> register(User user);
}
