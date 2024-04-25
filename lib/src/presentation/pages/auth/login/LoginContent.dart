import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultTextField.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginContent extends StatelessWidget {
  LoginBloc? bloc;
  LoginState state;
  LoginContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imagenBackgraund(context),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.6),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _icon(context),
                  _textlogin(),
                  _textFieldemail(),
                  _textFieldpassword(),
                  _botonlogin(context),
                  _textnotienescuenta(),
                  _botonRegister(context),
                  _botonRecuperarpass(context),
                  _iconredes(context),
                  _iconredesinst(context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFieldemail() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'correo electronico',
        icon: Icons.email,
        //errorText: snapshot.error?.toString(),
        onChanged: (text) {
          bloc?.add(EmailChanged(email: BlocForItem(value: text)));
        },

        validator: (value) {
          return state.email.error;
        },
      ),
    );
  }

  Widget _textFieldpassword() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
          label: 'password',
          icon: Icons.lock,
          // errorText: snapshot.error?.toString(),
          onChanged: (text) {
            bloc?.add(PasswordChanged(password: BlocForItem(value: text)));
          },
          obscureText: true,
          validator: (value) {
            return state.password.error;
          },
        ));
  }

  Widget _imagenBackgraund(BuildContext context) {
    return Image.asset(
      'assets/img/logogif.gif',
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
        margin: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 20),
        child: ElevatedButton(
            onPressed: () {
              if (state.formKey!.currentState!.validate()) {
                bloc?.add(LoginSubmit());
              } else {
                Fluttertoast.showToast(
                    msg: 'el formulario no es valido',
                    toastLength: Toast.LENGTH_LONG);
              }

              //   if (snapshot.hasData) {
              //     bloc?.login();
              //   } else {

              //   }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            child:
                Text('INICIAR SESION', style: TextStyle(color: Colors.black))));
  }

  Widget _textnotienescuenta() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(right: 6),
        ),
        Text(
          'no tienes cuenta',
          style: TextStyle(color: Colors.white),
        ),
        Container(
          width: 70,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(left: 6),
        )
      ],
    );
  }

  Widget _botonRegister(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(2, 10, 158, 1)),
          child: Text('registrar', style: TextStyle(color: Colors.white))),
    );
  }

  Widget _botonRecuperarpass(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: EdgeInsets.only(left: 25, right: 25, top: 10),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'recuperarpass');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(2, 10, 158, 1)),
          child: Text('Recuperar Password',
              style: TextStyle(color: Colors.white))),
    );
  }

  Widget _textlogin() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: Text(
        'login',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/img/logo_sniper.png',
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _iconredes(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 60,
          child: IconButton(
            onPressed: () {
              launchUrl(Uri.parse("https://wa.link/8uge7s"));
            },
            icon: Image.asset(
              'assets/img/LOGOWHATSAPP.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 60,
          child: IconButton(
            onPressed: () {
              launchUrl(Uri.parse(
                  "https://track.deriv.com/_kQiHwaQEDiUv_52HWb4YL2Nd7ZgqdRLk/1/"));
            },
            icon: Image.asset(
              'assets/img/deriv.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _iconredesinst(BuildContext context) {
    return Container(
      width: 60,
      child: IconButton(
        onPressed: () {
          launchUrl(Uri.parse(
              "https://www.instagram.com/miguelmonsalve_fx_lamaquina?utm_source=ig_web_button_share_sheet&igsh=ODdmZWVhMTFiMw=="));
        },
        icon: Image.asset(
          'assets/img/INSTAGRAM.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
