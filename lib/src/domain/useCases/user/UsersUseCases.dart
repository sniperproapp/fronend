import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/useCases/user/GetUsersUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/user/UpdateUserUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/user/activateuserUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/user/descargoUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/user/inactivateuserUseCase.dart';

class UsersUseCases {
  UpdateUserUseCase updateuser;
  GetUsersUseCase getuser;
  activateuserUseCase activate;
  inactivateuserUseCase inactivate;
  descargoUseCase descargo;

  UsersUseCases(
      {required this.updateuser,
      required this.getuser,
      required this.descargo,
      required this.activate,
      required this.inactivate});
}
