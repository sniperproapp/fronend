import 'package:flutter/material.dart';

import 'package:sniper_pro/src/domain/models/Zoom.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/bloc/AdminZoomListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/bloc/AdminZoomListEvent.dart';

class AdminZoomListItem extends StatelessWidget {
  Zoom? zoom;
  AdminZoomListBloc? bloc;
  AdminZoomListItem(this.bloc, this.zoom);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'admin/product/list', arguments: zoom);
      },
      child: ListTile(
        leading: zoom != null
            ? Container(
                width: 100,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/user.png',
                  image: zoom!.imagen!,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                ),
              )
            : Container(),
        title: Text(zoom?.name ?? ''),
        textColor: Colors.white,
        subtitle: Text(zoom?.description ?? ''),
        contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
        trailing: Wrap(direction: Axis.horizontal, children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'admin/Zoom/update',
                  arguments: zoom);
            },
            icon: Icon(Icons.edit),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              //bloc?.add(Deletezoom(id: zoom!.id!));
            },
            icon: Icon(Icons.delete),
            color: Colors.white,
          ),
        ]),
      ),
    );
  }
}
