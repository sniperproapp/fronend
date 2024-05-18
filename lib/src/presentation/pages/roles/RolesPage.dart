import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/domain/models/Rol.dart';
import 'package:sniper_pro/src/presentation/Messaging/bloc/notificationBloc.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/roles/bloc/RolesBloc.dart';
import 'package:sniper_pro/src/presentation/pages/roles/RolesItem.dart';
import 'package:sniper_pro/src/presentation/pages/roles/bloc/RolesState.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    context.read<NotificationBloc>().requesPermission();
    return Scaffold(
        body: BlocListener<RolesBloc, RolesState>(
      listener: (context, state) {
        final responseState = state.response;
        if (responseState is Success) {
          mostrarCuadroTutorial();
          final user = responseState.data as AuthResponse;

          if (user.user.mensaje == 1) {}
        } else if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          if (responseState.message == "Unauthorized") {
            Navigator.pushNamed(context, 'login/cerrarsesion');
          }
        }
      },
      child: BlocBuilder<RolesBloc, RolesState>(
        builder: (context, state) {
          return Stack(
            children: [
              _imageBackgraund(context),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: ListView(
                  shrinkWrap: true,
                  children: state.roles != null
                      ? (state.roles?.map((Role? rol) {
                          return rol != null ? RolesItem(rol) : Container();
                        }).toList()) as List<Widget>
                      : [],
                ),
              ),
            ],
          );
        },
      ),
    ));
  }

  Widget _imageBackgraund(BuildContext context) {
    return Image.asset(
      'assets/img/logogif.gif',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }

  void mostrarCuadroTutorial() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (builder) {
          return AlertDialog(
              backgroundColor: Color.fromRGBO(0, 0, 0, 1),
              contentPadding: EdgeInsets.zero,
              content: SizedBox(
                width: 400,
                height: 240,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/img/ICONOAYUDA.png')),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Text(
                          'TODOS LOS 5 DE CADA MES EL SERVICIO DE SEÑALES VENCE. PARA CONTINUAR DEBES COMPRAR EL MES . EL VALOR 120.000 PESOS COLOMBIANOS MAS INFORMACION AL WHATSAAP +573114693379',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 25),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cerrar',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.double,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
