import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sniper_pro/src/domain/models/Zoom.dart';

import 'package:sniper_pro/src/presentation/pages/client/zoom/bloc/clientZoomBloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientzoomContent extends StatelessWidget {
  Zoom? zoom;
  clientZoomBloc? _bloc;

  ClientzoomContent(this._bloc, this.zoom);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          launchUrl(Uri.parse(zoom!.link));
        },
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              zoom != null
                  ? Container(
                      height: 200,
                      child: zoom!.imagen!.isNotEmpty
                          ? FadeInImage.assetNetwork(
                              placeholder: 'assets/img/no-image.png',
                              image: zoom!.imagen!,
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
            child:
                Text(zoom!.description, style: TextStyle(color: Colors.white))),
      ),
    );
  }

  Widget _nombre(BuildContext context) {
    return SizedBox(
      // <-- Your width

      child: Container(
          child: Text(zoom!.name, style: TextStyle(color: Colors.white))),
    );
  }
}
