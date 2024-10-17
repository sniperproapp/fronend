import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProductListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProductListState.dart';

class ClientProductListItem extends StatelessWidget {
  Product? product;
  ClientProducListBloc? bloc;
  ClientProductListState? state;

  int index;
  ClientProductListItem(this.bloc, this.product, this.state, this.index);

  @override
  Widget build(BuildContext context) {
    int click = product!.like!;
    return Container(
      height: 257,
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Stack(children: [
        Container(
          height: 257,
          child: Image.asset(
            product?.estad == 'ACTIVO'
                ? 'assets/img/SEÑALACTIVACOMPRA.png'
                : product?.estad == 'CERRADA'
                    ? 'assets/img/SEÑALCERRADACOMPRA.png'
                    : 'assets/img/SEÑALPENDIENTECOMPRA.png',
          ),
        ),
        Column(
          children: [
            _cabecera(context),
            _punto1(),
            _sl(),
            _punto3(),
            _info(context, click),
          ],
        )
      ]),
    );
  }

  Widget _cabecera(BuildContext context) {
    return Container(
      width: 400,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          //cabecera
          Column(
            children: [
              _imagebagroun(context),
              Container(
                margin: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  product!.user?.name ?? '',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: product?.compventa == "SELL"
                          ? Colors.red
                          : Colors.blue),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 70),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    product?.name ?? '',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: product?.compventa == "SELL"
                            ? Colors.red
                            : Colors.blue),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    product?.fecha ?? '',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: product?.compventa == "SELL"
                            ? Colors.red
                            : Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imagebagroun(BuildContext context) {
    return Container(
        width: 44,
        margin: EdgeInsets.only(top: 12, left: 15),
        child: AspectRatio(
            aspectRatio: 1 / 1,
            child: ClipOval(
              child: product != null
                  ? Container(
                      width: 70,
                      child: product!.user?.imagen != null
                          ? FadeInImage.assetNetwork(
                              placeholder: 'assets/img/user.png',
                              image: product!.user!.imagen!,
                              fit: BoxFit.cover,
                              fadeInDuration: Duration(seconds: 1),
                            )
                          : Container(),
                    )
                  : Container(),
            )));
  }

  Widget _punto3() {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.1),
          borderRadius: BorderRadius.all(Radius.circular(35))),
      width: 315,
      margin: EdgeInsets.only(left: 20, right: 10),
      child: Row(
        children: [
          Container(
              width: 20,
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'TP',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          Container(
              margin: EdgeInsets.only(left: 20),
              width: 130,
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                product!.tp1.toString() +
                        '(' +
                        ((product!.price - product!.tp1!).abs())
                            .toStringAsFixed(0) +
                        ")PT" ??
                    '',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              )),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            width:50,
            height: 25,
            child: product?.tpactivate1 != true
                ? IconButton(icon: Icon(
                        Icons.copy_rounded,
                       size: 20,
                        color: Colors.white,),
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: product?.tp1.toString() ?? ''),
                      );
                      Fluttertoast.showToast(
                          msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                    },)
                     
                : Container(
                    child: Icon(
                    Icons.check,
                    color: Colors.green,
                  )),
          )
        ],
      ),
    );
  }

  Widget _info(BuildContext context, int click) {
    return Container(
      width: 400,
      margin: EdgeInsets.only( left: 20, right: 10),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 30,
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'client/product/detail',
                      arguments: product);
                },
                child: Text("INFO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
          ),
          Container(
              width: 70,
              child: Text(
                '',
                style: TextStyle(
                    color: product?.compventa == "SELL"
                        ? Colors.red
                        : Colors.blue),
              )),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text("like",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Text('(${product!.like})',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      child: Image.asset(
                        'assets/img/like1.gif',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          //print(product!.id!);

                          bloc?.add(
                              Changeidlist(id: product!.id!, index: index));

                          await Future.delayed(Duration(seconds: 3));
                          //  _bloc?.add(Restargif(id: product!.id!));
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.red,
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _punto1() {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.1),
          borderRadius: BorderRadius.all(Radius.circular(35))),
      width: 315,
      margin: EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
      child: Row(
        children: [
          Container(
              width: 50,
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'ENTRY',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          Container(
              margin: EdgeInsets.only(left: 20),
              width: 100,
              child: Text(
                product?.price.toString() ?? '',
                style: TextStyle(
                    color:
                        product?.compventa == "SELL" ? Colors.red : Colors.blue,
                    fontWeight: FontWeight.bold),
              )),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            
            height: 25,
            child:  IconButton(icon: Icon(
                        Icons.copy_rounded,
                       size: 20,
                        color: Colors.white,),
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: product?.price.toString() ?? ''),
                  );
                  Fluttertoast.showToast(
                      msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                },
                 ),
          )
        ],
      ),
    );
  }

  Widget _sl() {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.1),
          borderRadius: BorderRadius.all(Radius.circular(35))),
      width: 315,
      margin: EdgeInsets.only(left: 20, right: 10, bottom: 10),
      child: Row(
        children: [
          Container(
              width: 20,
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'SL',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )),
          Container(
              margin: EdgeInsets.only(left: 20),
              width: 130,
              child: Text(
                  product!.sl.toString() +
                          '(' +
                          ((product!.price - product!.sl!).abs())
                              .toStringAsFixed(0) +
                          ")PT" ??
                      '',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 13))),
          Container(
              margin: EdgeInsets.only(bottom: 5),
               
              height: 25,
              child: IconButton(icon: Icon(
                        Icons.copy_rounded,
                       size: 20,
                        color: Colors.white,),
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: product?.sl.toString() ?? ''));
                    Fluttertoast.showToast(
                        msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                  },
                   )),
        ],
      ),
    );
  }
}
