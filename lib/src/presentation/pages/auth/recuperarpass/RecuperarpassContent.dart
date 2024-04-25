import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/bloc/RecuperarpassBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/bloc/RecuperarpassEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/bloc/RecuperarpassState.dart';

import 'package:sniper_pro/src/presentation/widgets/DefaulButton.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultTextField.dart';

class RecuperarpassContent extends StatelessWidget {
  RecuperarpassBloc? bloc;
  RecuperarpassState state;
  RecuperarpassContent(this.bloc, this.state);

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
                      'Recuerar Password',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        icon: Icons.email,
                        label: 'Email',
                        onChanged: (text) {
                          bloc?.add(RecuperarpassEmailChanged(
                              email: BlocForItem(value: text)));
                        },
                        validator: (value) {
                          return state.email.error;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: DefaultButton(
                        text: 'Enviar',
                        onPressed: () {
                          if (state.formKey!.currentState!.validate()) {
                            bloc?.add(RecuperarpassFormSubmit());
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
