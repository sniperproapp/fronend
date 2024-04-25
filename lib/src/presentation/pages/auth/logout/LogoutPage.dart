import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/main.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/auth/logout/LogoutContent.dart';
import 'package:sniper_pro/src/presentation/pages/auth/logout/bloc/LogoutBloc.dart';
import 'package:sniper_pro/src/presentation/pages/auth/logout/bloc/LogoutState.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  LogoutBloc? _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LogoutBloc>(context, listen: false);

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: BlocListener<LogoutBloc, LogoutState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                  (route) => false);
            }
          },
          child:
              BlocBuilder<LogoutBloc, LogoutState>(builder: (context, state) {
            // en el blocbuilder se muestran todos los widget
            final responseState = state.response;
            if (responseState is Loading) {
              return Stack(
                children: [
                  LogoutContent(_bloc, state),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return LogoutContent(_bloc, state);
          }),
        ),
      ),
    );
  }
}
