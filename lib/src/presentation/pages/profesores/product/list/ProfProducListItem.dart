import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProductListEvent.dart';

class ProfProducListItem extends StatelessWidget {
  Product? product;
  ProfProducListBloc? bloc;
  ProfProducListItem(this.bloc, this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Color.fromRGBO(0, 0, 0, 0.7),
        child: Column(
          children: [
            product != null
                ? Container(
                    width: 200,
                    height: 300,
                    // ignore: unnecessary_null_comparison
                    child: product!.image2! != null
                        ? FadeInImage.assetNetwork(
                            placeholder: 'assets/img/user.png',
                            image: product!.image2!,
                            fit: BoxFit.cover,
                            fadeInDuration: Duration(seconds: 1),
                          )
                        : Container(),
                  )
                : Container(),
            Text(product?.name ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: product?.compventa == 'BUY'
                        ? Colors.blue
                        : Colors.red)),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [_tp(), _precios()],
                  ),
                ),
              ],
            ),
            Wrap(direction: Axis.horizontal, children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Prof/product/update',
                        arguments: product);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
              // IconButton(
              //     onPressed: () {
              //       bloc?.add(Deleteproduct(id: product!.id!));
              //     },
              //     icon: Icon(Icons.delete)),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _precios() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Container(
            height: 40,
            child: Row(
              children: [
                Container(
                    width: 60,
                    child: Text('punto 1:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: product?.compventa == 'BUY'
                                ? Colors.blue
                                : Colors.red))),
                Container(
                    width: 70,
                    child: Text(
                      product?.price.toString() ?? '',
                      style: TextStyle(
                          color: product?.compventa == 'BUY'
                              ? Colors.blue
                              : Colors.red),
                    )),
              ],
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Container(
                    width: 60,
                    child: Text('punto 2:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: product?.compventa == 'BUY'
                                ? Colors.blue
                                : Colors.red))),
                Container(
                    width: 70,
                    child: Text(product?.price1.toString() ?? '',
                        style: TextStyle(
                            color: product?.compventa == 'BUY'
                                ? Colors.blue
                                : Colors.red))),
              ],
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Container(
                    width: 60,
                    child: Text('punto 3:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: product?.compventa == 'BUY'
                                ? Colors.blue
                                : Colors.red))),
                Container(
                    width: 70,
                    child: Text(product?.price2.toString() ?? '',
                        style: TextStyle(
                            color: product?.compventa == 'BUY'
                                ? Colors.blue
                                : Colors.red))),
              ],
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Container(
                    width: 60,
                    child: Text('SL:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red))),
                Container(
                    width: 70,
                    child: Text(product?.sl.toString() ?? '',
                        style: TextStyle(color: Colors.red))),
                Container(
                    child: Checkbox(
                  checkColor:
                      product?.slactivate == false ? Colors.red : Colors.green,
                  value: product?.slactivate,
                  onChanged: (bool? value) {
                    if (product?.tpactivate1 != true &&
                        product?.descarte != true) {
                      bloc?.add(Activatetp1change(id: product!.id!, numero: 6));
                    } else {
                      Fluttertoast.showToast(
                          msg:
                              'No Puede ser SL si hay un TP activo o esta Descartada la señal',
                          toastLength: Toast.LENGTH_LONG);
                    }

//product?.slactivate = value;
                  },
                )),
              ],
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Container(
                    width: 70,
                    child: Text(product?.compventa.toString() ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: product?.compventa == 'BUY'
                                ? Colors.blue
                                : Colors.red))),
              ],
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Container(
                    width: 120,
                    child: Text(product?.estad.toString() ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: product?.estad == 'ACTIVO'
                                ? Colors.green
                                : Colors.red))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tp() {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                width: 40,
                child: Text(
                  'TP 1:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: product?.tpactivate1 == false
                          ? Colors.red
                          : Colors.green),
                ),
              ),
              Container(
                width: 70,
                child: Text(
                  product?.tp1.toString() ?? '',
                  style: TextStyle(
                      color: product?.tpactivate1 == false
                          ? Colors.red
                          : Colors.green),
                ),
              ),
              Container(
                  child: Checkbox(
                checkColor:
                    product?.tpactivate1 == false ? Colors.red : Colors.green,
                value: product?.tpactivate1,
                onChanged: (bool? value) {
                  if (product?.descarte != true &&
                      product?.slactivate != true) {
                    bloc?.add(Activatetp1change(id: product!.id!, numero: 1));
                  } else {
                    Fluttertoast.showToast(
                        msg:
                            'No Puede ser TP si hay un DESCARTE activo o esta en Sl la señal',
                        toastLength: Toast.LENGTH_LONG);
                  }
                },
              )),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Container(
                width: 40,
                child: Text(
                  'TP 2:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: product?.tpactivate2 == false
                          ? Colors.red
                          : Colors.green),
                ),
              ),
              Container(
                width: 70,
                child: Text(
                  product?.tp2.toString() ?? '',
                  style: TextStyle(
                      color: product?.tpactivate2 == false
                          ? Colors.red
                          : Colors.green),
                ),
              ),
              Container(
                  child: Checkbox(
                checkColor:
                    product?.tpactivate2 == false ? Colors.red : Colors.green,
                value: product?.tpactivate2,
                onChanged: (bool? value) {
                  if (product?.descarte != true &&
                      product?.slactivate != true) {
                    bloc?.add(Activatetp1change(id: product!.id!, numero: 2));
                  } else {
                    Fluttertoast.showToast(
                        msg:
                            'No Puede ser TP si hay un DESCARTE activo o esta en Sl la señal',
                        toastLength: Toast.LENGTH_LONG);
                  }
                },
              )),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width: 40,
              child: Text(
                'TP 3:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: product?.tpactivate3 == false
                        ? Colors.red
                        : Colors.green),
              ),
            ),
            Container(
              width: 70,
              child: Text(
                product?.tp3.toString() ?? '',
                style: TextStyle(
                    color: product?.tpactivate3 == false
                        ? Colors.red
                        : Colors.green),
              ),
            ),
            Container(
                child: Checkbox(
              checkColor:
                  product?.tpactivate3 == false ? Colors.red : Colors.green,
              value: product?.tpactivate3,
              onChanged: (bool? value) {
                if (product?.descarte != true && product?.slactivate != true) {
                  bloc?.add(Activatetp1change(id: product!.id!, numero: 3));
                } else {
                  Fluttertoast.showToast(
                      msg:
                          'No Puede ser TP si hay un DESCARTE activo o esta en Sl la señal',
                      toastLength: Toast.LENGTH_LONG);
                }
              },
            )),
          ],
        ),
        Row(
          children: [
            Container(
              width: 40,
              child: Text(
                'TP 4:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: product?.tpactivate4 == false
                        ? Colors.red
                        : Colors.green),
              ),
            ),
            Container(
              width: 70,
              child: Text(
                product?.tp4.toString() ?? '',
                style: TextStyle(
                    color: product?.tpactivate4 == false
                        ? Colors.red
                        : Colors.green),
              ),
            ),
            Container(
                child: Checkbox(
              checkColor:
                  product?.tpactivate4 == false ? Colors.red : Colors.green,
              value: product?.tpactivate4,
              onChanged: (bool? value) {
                if (product?.descarte != true && product?.slactivate != true) {
                  bloc?.add(Activatetp1change(id: product!.id!, numero: 4));
                } else {
                  Fluttertoast.showToast(
                      msg:
                          'No Puede ser TP si hay un DESCARTE activo o esta en Sl la señal',
                      toastLength: Toast.LENGTH_LONG);
                }
              },
            )),
          ],
        ),
        Row(
          children: [
            Container(
              width: 40,
              child: Text(
                'TP 5:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: product?.tpactivate5 == false
                        ? Colors.red
                        : Colors.green),
              ),
            ),
            Container(
              width: 70,
              child: Text(
                product?.tp5.toString() ?? '',
                style: TextStyle(
                    color: product?.tpactivate5 == false
                        ? Colors.red
                        : Colors.green),
              ),
            ),
            Container(
                child: Checkbox(
              checkColor:
                  product?.tpactivate5 == false ? Colors.red : Colors.green,
              value: product?.tpactivate5,
              onChanged: (bool? value) {
                if (product?.descarte != true && product?.slactivate != true) {
                  bloc?.add(Activatetp1change(id: product!.id!, numero: 5));
                } else {
                  Fluttertoast.showToast(
                      msg:
                          'No Puede ser TP si hay un DESCARTE activo o esta en Sl la señal',
                      toastLength: Toast.LENGTH_LONG);
                }
              },
            )),
          ],
        ),
        Row(
          children: [
            Container(
              width: 100,
              child: Text(
                'DESCARTAR:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: product?.tpactivate5 == false
                        ? Colors.red
                        : Colors.green),
              ),
            ),
            Container(
                child: Checkbox(
              checkColor:
                  product?.descarte == false ? Colors.red : Colors.green,
              value: product?.descarte,
              onChanged: (bool? value) {
                if (product?.tpactivate1 != true &&
                    product?.slactivate != true) {
                  bloc?.add(Activatetp1change(id: product!.id!, numero: 7));
                } else {
                  Fluttertoast.showToast(
                      msg:
                          'No Puede ser descartado si hay un TP activo o esta en Sl la señal',
                      toastLength: Toast.LENGTH_LONG);
                }
              },
            )),
          ],
        ),
      ],
    );
  }
}
