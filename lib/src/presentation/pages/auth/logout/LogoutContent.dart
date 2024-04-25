import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/main.dart';
import 'package:sniper_pro/src/presentation/pages/auth/logout/bloc/LogoutBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/logout/bloc/LogoutEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/logout/bloc/LogoutState.dart';

class LogoutContent extends StatelessWidget {
  LogoutBloc? bloc;
  LogoutState state;

  LogoutContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_imagenBackgraund(context), _botonlogin(context)],
    );
  }

  Widget _imagenBackgraund(BuildContext context) {
    return Image.asset(
      'assets/img/background1.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Colors.black54,
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _botonlogin(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 20),
        child: ElevatedButton(
            onPressed: () {
              bloc?.add(Logoutgeneral());
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            child:
                Text('CERRAR SESION', style: TextStyle(color: Colors.black))));
  }
}
