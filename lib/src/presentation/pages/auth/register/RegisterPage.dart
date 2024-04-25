import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/main.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/RegiterContent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/bloc/RegisterState.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc? _bloc;
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _registerBlocCubit?.dispose();
    // });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                final responseState = state.response;
                if (responseState is Error) {
                  Fluttertoast.showToast(
                      msg: responseState.message,
                      toastLength: Toast.LENGTH_LONG);
                } else if (responseState is Success) {
                  _bloc?.add(RegisterFormReset());
                  Fluttertoast.showToast(
                      msg: 'registro  exitoso', toastLength: Toast.LENGTH_LONG);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (route) => false);
                }
              },
              child: BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, State) {
                return RegisterContent(_bloc, State);
              }),
            )));
  }
}
