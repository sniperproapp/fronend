import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/user/UsersUseCases.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/bloc/clientproducdescargoState.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/bloc/clientproductdescargoEvent.dart';

class clientproductdescargoBloc
    extends Bloc<clientproductdescargoEvent, clientproducdescargoState> {
  UsersUseCases useCases;
  AuthUseCases authUseCases;
  clientproductdescargoBloc(this.useCases, this.authUseCases)
      : super(clientproducdescargoState()) {
    on<aceptardescargo>(_onaceptardescargo);
    on<inituser>(_oninituser);
    on<cambiarvalordescargouser>(_oncambiarvalordescargouseruser);
  }

  Future<void> _onaceptardescargo(
      aceptardescargo event, Emitter<clientproducdescargoState> emit) async {
    AuthResponse authResponse = await authUseCases.getusersession.rum();

    Resource response = await useCases.descargo.run(authResponse.user.id!);

    emit(state.copyWith(
        response: response, authResponse: authResponse, respuesta: 'ACEPTADO'));
  }

  Future<void> _oncambiarvalordescargouseruser(cambiarvalordescargouser event,
      Emitter<clientproducdescargoState> emit) async {
    AuthResponse authResponse = await authUseCases.getusersession.rum();

    authResponse.user.descargo = 1;
    await authUseCases.saveusersession.run(authResponse);
  }

  Future<void> _oninituser(
      inituser event, Emitter<clientproducdescargoState> emit) async {
    AuthResponse authResponse = await authUseCases.getusersession.rum();
    String respuesta = 'ACEPTO';
    Resource validar = Error('false');
    if (authResponse.user.descargo == 1) {
      respuesta = "ACEPTADO";
      validar = Success(true);
    }

    emit(state.copyWith(
        response: validar, authResponse: authResponse, respuesta: respuesta));
  }
}
