import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaulButton.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultTextField.dart';

class RegisterContent extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;
  RegisterContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/img/logogif.gif',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            color: Color.fromRGBO(0, 0, 0, 0.4),
            colorBlendMode: BlendMode.darken,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/img/logo_sniper.png',
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                    Text(
                      'REGISTER',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        icon: Icons.person,
                        label: 'Nombre',
                        onChanged: (text) {
                          bloc?.add(RegisterNameChanged(
                              name: BlocForItem(value: text)));
                        },
                        validator: (value) {
                          return state.name.error;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        icon: Icons.person,
                        label: 'Apellido',
                        onChanged: (text) {
                          bloc?.add(RegisterLastnameChanged(
                              lastname: BlocForItem(value: text)));
                        },
                        validator: (value) {
                          return state.lastname.error;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        icon: Icons.email,
                        label: 'Email',
                        onChanged: (text) {
                          bloc?.add(RegisterEmailChanged(
                              email: BlocForItem(value: text)));
                        },
                        validator: (value) {
                          return state.email.error;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        icon: Icons.phone,
                        label: 'telefono',
                        onChanged: (text) {
                          bloc?.add(RegisterPhoneChanged(
                              phone: BlocForItem(value: text)));
                        },
                        validator: (value) {
                          return state.phone.error;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        icon: Icons.lock,
                        label: 'Password',
                        onChanged: (text) {
                          bloc?.add(RegisterPasswordChanged(
                              password: BlocForItem(value: text)));
                        },
                        obscureText: true,
                        validator: (value) {
                          return state.password.error;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        icon: Icons.lock_outline,
                        label: 'repetir password',
                        onChanged: (text) {
                          bloc?.add(RegisterConfirPasswordChanged(
                              confirpassword: BlocForItem(value: text)));
                        },
                        obscureText: true,
                        validator: (value) {
                          return state.confirmpassword.error;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: DefaultButton(
                        text: 'registrate',
                        onPressed: () {
                          if (state.formKey!.currentState!.validate()) {
                            bloc?.add(RegisterFormSubmit());
                          } else {
                            Fluttertoast.showToast(
                                msg: 'el formulario esta incorrecto',
                                toastLength: Toast.LENGTH_LONG);
                          }
                        },
                        color: Color.fromRGBO(2, 10, 158, 1),
                      ),
                    )
                  ],
                ),
              )),
          DefaultIconBack(left: 50, top: 125)
        ],
      ),
    );
  }
}
