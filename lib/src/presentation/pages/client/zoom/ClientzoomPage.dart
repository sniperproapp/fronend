import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Zoom.dart';
import 'package:sniper_pro/src/domain/models/video.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/ClientvideoContent.dart';

import 'package:sniper_pro/src/presentation/pages/client/videos/bloc/clientvideoBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/bloc/clientvideoEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/bloc/clientvideoState.dart';
import 'package:sniper_pro/src/presentation/pages/client/zoom/ClientzoomContent.dart';
import 'package:sniper_pro/src/presentation/pages/client/zoom/bloc/clientZoomBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/zoom/bloc/clientZoomEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/zoom/bloc/clientZoomState.dart';
import 'package:video_player/video_player.dart';

class ClientzoomPage extends StatefulWidget {
  const ClientzoomPage({super.key});

  @override
  State<ClientzoomPage> createState() => _ClientzoomPageState();
}

class _ClientzoomPageState extends State<ClientzoomPage> {
  clientZoomBloc? _bloc;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(Getzoom());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<clientZoomBloc>(context);
    return Scaffold(
        body: BlocListener<clientZoomBloc, clientZoomState>(
      listener: (context, state) {
        final responseState = state.response;
        if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          if (responseState.message == "Unauthorized") {
            Navigator.pushNamed(context, 'login/cerrarsesion');
          }
        }
      },
      child: BlocBuilder<clientZoomBloc, clientZoomState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Success) {
          List<Zoom> zoom = responseState.data as List<Zoom>;

          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/fondodrawel.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView.builder(
              itemCount: zoom.length,
              itemBuilder: (context, index) {
                return ClientzoomContent(_bloc, zoom[index]);
              },
            ),
          );
        }
        return Container();
      }),
    ));
  }
}
