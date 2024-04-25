import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/video.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/ClientplayvideoContent.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/bloc/clientvideoBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/bloc/clientvideoState.dart';

import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';

class ClientvideoContent extends StatelessWidget {
  Video? video;
  clientvideoBloc? _bloc;

  ClientvideoContent(this._bloc, this.video);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(PageRouteBuilder(pageBuilder: (context, animation, _) {
            return FadeTransition(
                opacity: animation, child: ClientplayvideoContent(video!));
          }));
        },
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              video != null
                  ? Container(
                      height: 200,
                      child: video!.imagen!.isNotEmpty
                          ? FadeInImage.assetNetwork(
                              placeholder: 'assets/img/no-image.png',
                              image: video!.imagen!,
                              fit: BoxFit.contain,
                              fadeInDuration: Duration(seconds: 1),
                            )
                          : Container())
                  : Container(),
            ]),
            Container(
              margin: EdgeInsets.only(top: 100, left: 20),
              child: Column(
                children: [
                  _nombre(context),
                  _botonActivas(context),
                ],
              ),
            )
          ]),
        ));
  }

  Widget _botonActivas(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Center(
        child: Container(
            child: Text(video!.description,
                style: TextStyle(color: Colors.white))),
      ),
    );
  }

  Widget _nombre(BuildContext context) {
    return SizedBox(
      // <-- Your width

      child: Container(
          child: Text(video!.name, style: TextStyle(color: Colors.white))),
    );
  }

  Widget _botonCerradas(BuildContext context) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(2, 10, 158, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: Text('CERRADAS', style: TextStyle(color: Colors.white))),
    );
  }
}
