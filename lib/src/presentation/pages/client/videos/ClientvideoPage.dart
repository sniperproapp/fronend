import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/video.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/ClientvideoContent.dart';

import 'package:sniper_pro/src/presentation/pages/client/videos/bloc/clientvideoBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/bloc/clientvideoEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/bloc/clientvideoState.dart';
import 'package:video_player/video_player.dart';

class ClientvideoPage extends StatefulWidget {
  const ClientvideoPage({super.key});

  @override
  State<ClientvideoPage> createState() => _ClientvideoPageState();
}

class _ClientvideoPageState extends State<ClientvideoPage> {
  clientvideoBloc? _bloc;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(Getvideo());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<clientvideoBloc>(context);
    return Scaffold(
        body: BlocListener<clientvideoBloc, clientvideoState>(
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
      child: BlocBuilder<clientvideoBloc, clientvideoState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Success) {
          List<Video> video = responseState.data as List<Video>;

          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/fondodrawel.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView.builder(
              itemCount: video.length,
              itemBuilder: (context, index) {
                return ClientvideoContent(_bloc, video[index]);
              },
            ),
          );
        }
        return Container();
      }),
    ));
  }
}
