import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sniper_pro/src/domain/models/Zoom.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/bloc/AdminZoomUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/bloc/AdminZoomUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/bloc/AdminZoomListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/bloc/AdminZoomListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/AdminZoomUpdateContent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/bloc/AdminZoomUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/bloc/AdminZoomUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/bloc/AdminZoomUpdateState.dart';

class AdminZoomUpdatePage extends StatefulWidget {
  const AdminZoomUpdatePage({super.key});

  @override
  State<AdminZoomUpdatePage> createState() => _AdminZoomUpdatePageState();
}

class _AdminZoomUpdatePageState extends State<AdminZoomUpdatePage> {
  Zoom? zoom;

  AdminZoomUpdateBloc? _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(AdminzoomInitEvent(zoom: zoom));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _bloc?.add(ResetForm());
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminZoomUpdateBloc>(context);
    zoom = ModalRoute.of(context)?.settings.arguments as Zoom;
    return Scaffold(
        body: BlocListener<AdminZoomUpdateBloc, AdminZoomUpdateState>(
      listener: (context, state) {
        final responsestate = state.response;
        if (responsestate is Success) {
          context.read<AdminZoomListBloc>().add(Getzoom());

          Fluttertoast.showToast(
              msg: 'Zoom Modificado correctamente',
              toastLength: Toast.LENGTH_LONG);
        } else if (responsestate is Error) {
          Fluttertoast.showToast(
              msg: responsestate.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<AdminZoomUpdateBloc, AdminZoomUpdateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              AdminZoomUpdateContent(_bloc, state, zoom),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return AdminZoomUpdateContent(_bloc, state, zoom);
      }),
    ));
  }
}
