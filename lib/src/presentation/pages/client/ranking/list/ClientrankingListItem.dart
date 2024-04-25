import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/Ranking.dart';
import 'package:sniper_pro/src/presentation/pages/client/ranking/list/bloc/ClientRankingListBloc.dart';

class ClientrankingListItem extends StatelessWidget {
  Ranking? ranking;
  ClientRankingListBloc? bloc;
  ClientrankingListItem(this.bloc, this.ranking);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: []),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(45, 27, 112, 0.514),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _imagen(context),
                  _botonganadaperdidas(context),
                  _botonActivas(context),
                  _botonCerradas(context),
                ],
              ),
            )
          ]),
        ));
  }

  Widget _botonActivas(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('TOTAL', style: TextStyle(color: Colors.white)),
          Text(ranking!.total!.toString(),
              style: TextStyle(color: Colors.green))
        ],
      ),
    );
  }

  Widget _imagen(BuildContext context) {
    return Center(
      child: Container(
          width: 80,
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipOval(
                      child: Container(
                    width: 70,
                    child: ranking!.imagen! != null
                        ? FadeInImage.assetNetwork(
                            placeholder: 'assets/img/user.png',
                            image: ranking!.imagen!,
                            fit: BoxFit.cover,
                            fadeInDuration: Duration(seconds: 1),
                          )
                        : Image.asset(
                            'assets/img/no-image.png',
                            fit: BoxFit.cover,
                          ),
                  ))),
              Text(ranking!.nombre!, style: TextStyle(color: Colors.white)),
            ],
          )),
    );
  }

  Widget _botonganadaperdidas(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('G/P', style: TextStyle(color: Colors.white)),
          Row(
            children: [
              Text('${ranking!.ganadas!}/',
                  style: TextStyle(color: Colors.green)),
              Text(((ranking!.ganadas! - ranking!.total!).abs()).toString(),
                  style: TextStyle(color: Colors.red)),
            ],
          )
        ],
      ),
    );
  }

  Widget _botonCerradas(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('%', style: TextStyle(color: Colors.white)),
          Text(
              '${(ranking!.ganadas! / ranking!.total! * 100).toStringAsFixed(2)}%',
              style: TextStyle(color: Colors.green))
        ],
      ),
    );
  }
}
