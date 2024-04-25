import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profile/update/ProfileUpdateContent.dart';
import 'package:sniper_pro/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  ProfileUpdateBloc? _bloc;
  User? user;
  @override
  void initState() {
    //se va a disparar una sola vez cuando la pantalla es mostrada solo lo posee un StatefulWidget
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(ProfileUpdateInitEvent(user: user));
    });
  }

  @override
  Widget build(BuildContext context) {
    //se dispara despues del  y el buil se dispara varias veces
    _bloc = BlocProvider.of<ProfileUpdateBloc>(context);
    user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
        body: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
      listener: (context, state) {
        final responsestate = state.response;
        if (responsestate is Error) {
          Fluttertoast.showToast(
              msg: responsestate.message, toastLength: Toast.LENGTH_LONG);
        } else if (responsestate is Success) {
          _bloc?.add(ProfileUpdateUpdateUserSesion(
              user: responsestate.data)); //actualizar los datos de sesion
          Future.delayed(Duration(seconds: 1), () {
            context.read<ProfileInfoBloc>().add(
                ProfileInfoGetUser()); //actualizar informacion de sesion de la pamtalla infosesion
          });
          Fluttertoast.showToast(
              msg: 'Datos Actualizados', toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              ProfileUpdateContent(user, _bloc, state),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }

        return ProfileUpdateContent(user, _bloc, state);
      }),
    ));
  }
}
