import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/data/dataSource/local/SharedPref.dart';
import 'package:sniper_pro/src/data/dataSource/remote/services/AuthService.dart';
import 'package:sniper_pro/src/domain/Repository/AuthRepositry.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/models/User.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService authService;
  SharedPref sharedPref;
  AuthRepositoryImpl(this.authService, this.sharedPref);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authService.register(user);
  }

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharedPref.read('user');
    if (data != null) {
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }

  @override
  Future<List<Category>?> getcategorySession() async {
    final data = await sharedPref.read('list');
    if (data != null) {
      List<Category> list = Category.fromJsonList(data);
      return list;
    }
    return null;
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharedPref.save('user', authResponse.toJson());
  }

  @override
  Future<void> saveCategorySession(List<Category> categoris) async {
    Fluttertoast.showToast(
        msg: categoris[0].notification.toString(),
        toastLength: Toast.LENGTH_LONG);
    sharedPref.save('list', categoris);
  }

  @override
  Future<void> saveUsertokenmessage(String token) async {
    sharedPref.save('token', token);
  }

  @override
  Future<bool> logout() async {
    final respuesta = await authService.logout();
    final respuesta2 = await sharedPref.remove('user');

    if (respuesta) {
      return respuesta2;
    } else {
      return false;
    }
  }

  @override
  Future<Resource<bool>> recuperarpass(String email) {
    return authService.recuperarpass(email);
  }
}
