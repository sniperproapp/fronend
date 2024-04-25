import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/main.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/RecuperarpassContent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/bloc/RecuperarpassBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/bloc/RecuperarpassEvent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/bloc/RecuperarpassState.dart';

class RecuperarpassPage extends StatefulWidget {
  const RecuperarpassPage({super.key});

  @override
  State<RecuperarpassPage> createState() => _RecuperarpassPageState();
}

class _RecuperarpassPageState extends State<RecuperarpassPage> {
  RecuperarpassBloc? _bloc;
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _registerBlocCubit?.dispose();
    // });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<RecuperarpassBloc>(context);
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: BlocListener<RecuperarpassBloc, RecuperarpassState>(
              listener: (context, state) {
                final responseState = state.response;
                if (responseState is Error) {
                  Fluttertoast.showToast(
                      msg: responseState.message,
                      toastLength: Toast.LENGTH_LONG);
                } else if (responseState is Success) {
                  _bloc?.add(RecuperarpassFormReset());
                  Fluttertoast.showToast(
                      msg: 'correo enviado', toastLength: Toast.LENGTH_LONG);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (route) => false);
                }
              },
              child: BlocBuilder<RecuperarpassBloc, RecuperarpassState>(
                  builder: (context, State) {
                return RecuperarpassContent(_bloc, State);
              }),
            )));
  }
}
