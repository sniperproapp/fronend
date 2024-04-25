import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class clientproducdescargoState extends Equatable {
  final Resource? response;
  final String? respuesta;
  final AuthResponse? authResponse;

  const clientproducdescargoState(
      {this.response, this.respuesta = 'ACEPTADO', this.authResponse});

  clientproducdescargoState copyWith(
      {Resource? response, AuthResponse? authResponse, String? respuesta}) {
    return clientproducdescargoState(
        response: response,
        authResponse: authResponse,
        respuesta: respuesta ?? this.respuesta);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response, authResponse, respuesta];
}
