import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/models/Rol.dart';
import 'package:sniper_pro/src/presentation/Messaging/bloc/notificationBloc.dart';
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
    context.read<notificationBloc>().requesPermission();
    return Scaffold(
      body: BlocBuilder<RolesBloc, RolesState>(
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
    );
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
}
