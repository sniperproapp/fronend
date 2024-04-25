import 'package:sniper_pro/src/domain/useCases/auth/GetCategorySessionUserCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/GetUserSessionUserCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/RecuperarpassUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/SaveCategorySessionUserCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/SaveUserSessionUserCase.dart';
import 'package:sniper_pro/src/domain/useCases/auth/SaveUsertokenmessageCase.dart';

class AuthUseCases {
  LoginUseCase login;
  LogoutUseCase logout;
  RegisterUseCase register;
  SaveUserSessionUserCase saveusersession;
  SavecategorySessionUseCase savelistcategory;
  GetUserSessionUserCase getusersession;
  GetCategorySessionUserCase getcategorysession;
  SaveUsertokenmessageCase messagetoken;
  RecuperarpassUseCase enviarmail;

  AuthUseCases(
      {required this.login,
      required this.logout,
      required this.enviarmail,
      required this.register,
      required this.saveusersession,
      required this.savelistcategory,
      required this.getusersession,
      required this.getcategorysession,
      required this.messagetoken});
}
