import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/presentation/Messaging/bloc/notificationBloc.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/domain/models/AuthResponse.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:sniper_pro/src/presentation/pages/roles/RolesPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LoginBloc>(context, listen: false);
    context.read<notificationBloc>().requesPermission();
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Error) {
              Fluttertoast.showToast(
                  msg: responseState.message,
                  backgroundColor: Colors.green,
                  toastLength: Toast.LENGTH_LONG);
            } else if (responseState is Success) {
              final authResponse = responseState.data as AuthResponse;
              _bloc?.add(LoginFormReset());

              _bloc?.add(loginSaveUserSession(authResponse: authResponse));
              Fluttertoast.showToast(
                  msg: 'Login exitoso', toastLength: Toast.LENGTH_LONG);
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'Roles', (route) => false);
              });
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            // en el blocbuilder se muestran todos los widget
            final responseState = state.response;
            if (responseState is Loading) {
              return Stack(
                children: [
                  LoginContent(_bloc, state),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return LoginContent(_bloc, state);
          }),
        ),
      ),
    );
  }
}
