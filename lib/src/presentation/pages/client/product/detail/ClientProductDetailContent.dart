import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/ClientProductDetailPage.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/ClientimagenDetailContent.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/bloc/clientproducdetailState.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/bloc/clientproductdetailBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/bloc/clientproductdetailEvent.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';

class ClientProductDetailContent extends StatelessWidget {
  Product? product;
  ClientproductdetailBloc? _bloc;
  ClientproducdetailState? state;
  ClientProductDetailContent(this._bloc, this.product, this.state);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/fondodrawel.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  _textname(),
                  Container(
                      height: 200,
                      child: Column(children: [
                        _punto1(),
                        _punto2(),
                        _punto3(),
                        _sl(),
                      ])),
                  _textDescription(),
                  _texttp(),
                  Container(
                      height: 220,
                      child: Column(
                        children: [
                          _tp1(),
                          _tp2(),
                          _tp3(),
                          _tp4(),
                          _tp5(),
                        ],
                      )),
                  _imageSliderShow(context),
                ],
              ),
              Divider(
                color: Colors.black,
                height: 1,
                thickness: 3,
              ),
              _actionShopinbag(context)
            ],
          ),
        ),
        DefaultIconBack(
          left: 15,
          top: 35,
          color: Colors.white,
        )
      ],
    );
  }

  Widget _actionShopinbag(BuildContext context) {
    return Container(
      color: Color.fromRGBO(2, 10, 158, 0.5),
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10, left: 30, right: 30),
      child: Row(
        children: [
          Spacer(),
          Container(
            child: Text(
              'Deja tu like(${state?.like})',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                child: state!.banderalike == 2
                    ? Container()
                    : Image.asset(
                        'assets/img/like.gif',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 15, right: 8),
                  child: IconButton(
                      onPressed: () async {
                        //print(product!.id!);

                        // Fluttertoast.showToast(
                        //     msg: 'like', toastLength: Toast.LENGTH_LONG);
                        _bloc?.add(Changeid(id: product!.id!));
                        await Future.delayed(Duration(seconds: 3));
                        _bloc?.add(Restargif(id: product!.id!));
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.red,
                      ))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textname() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 85),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                product?.name ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: product?.compventa == 'BUY' ? Colors.blue : Colors.red,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  product?.fecha ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: product?.compventa == "SELL"
                          ? Colors.red
                          : Colors.blue),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              product!.estad!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background1.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.4),
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _texttp() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      child: Text(
        'Take Profit',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.green),
      ),
    );
  }

  Widget _textDescription() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'INFO:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              )),
          Container(
              width: 253,
              margin: EdgeInsets.only(left: 10),
              child: Text(
                product?.description ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              )),
        ],
      ),
    );
  }

  Widget _imageSliderShow(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Text(
          'Imagen',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        )),
        ImageSlideshow(
          /// Width of the [ImageSlideshow].
          width: double.infinity,

          /// Height of the [ImageSlideshow].
          height: 200,

          /// The page to show when first creating the [ImageSlideshow].
          initialPage: 0,

          /// The color to paint the indicator.
          indicatorColor: Colors.blue,

          /// The color to paint behind th indicator.
          indicatorBackgroundColor: Colors.grey,

          /// The widgets to display in the [ImageSlideshow].
          /// Add the sample image file into the images folder
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    PageRouteBuilder(pageBuilder: (context, animation, _) {
                  return FadeTransition(
                      opacity: animation,
                      child: ClientimagenDetailContent(product!.image2!));
                }));
              },
              child: Hero(
                tag: 'my_image',
                child: Image.network(
                  product!.image2!,
                  fit: BoxFit.contain,
                  height: 120,
                  width: 120,
                ),
              ),
            ),
          ],

          /// Called whenever the page in the center of the viewport changes.
          onPageChanged: (value) {
            print('Page changed: $value');
          },

          /// Auto scroll interval.
          /// Do not auto scroll with null or 0.
          //  autoPlayInterval: 3000,

          /// Loops back to first slide.
          // isLoop: true,
        ),
      ],
    );
  }

  Widget _punto3() {
    return product?.price2.toString() == "0.0"
        ? Container()
        : Container(
            margin: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Container(
                    width: 53,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'ENTRY:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: product?.compventa == "SELL"
                              ? Colors.red
                              : Colors.blue),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 120,
                    child: Text(
                      product?.price2.toString() ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: product?.compventa == "SELL"
                              ? Colors.red
                              : Colors.blue),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 90,
                  height: 25,
                  child: ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                        Clipboard.setData(ClipboardData(
                            text: product?.price2.toString() ?? ''));
                      },
                      child: Text("copiar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: product?.compventa == "SELL"
                                ? Colors.red
                                : Colors.blue,
                            fontSize: 10,
                          ))),
                )
              ],
            ),
          );
  }

  Widget _punto2() {
    return product?.price1.toString() == "0.0"
        ? Container()
        : Container(
            margin: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Container(
                    width: 53,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'ENTRY:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: product?.compventa == "SELL"
                              ? Colors.red
                              : Colors.blue),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 120,
                    child: Text(
                      product?.price1.toString() ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: product?.compventa == "SELL"
                              ? Colors.red
                              : Colors.blue),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 90,
                  height: 25,
                  child: ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                        Clipboard.setData(ClipboardData(
                            text: product?.price1.toString() ?? ''));
                      },
                      child: Text("copiar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: product?.compventa == "SELL"
                                ? Colors.red
                                : Colors.blue,
                            fontSize: 10,
                          ))),
                )
              ],
            ),
          );
  }

  Widget _punto1() {
    return product?.price.toString() == "0.0"
        ? Container()
        : Container(
            margin: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Container(
                    width: 53,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'ENTRY:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: product?.compventa == "SELL"
                              ? Colors.red
                              : Colors.blue),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 120,
                    child: Text(
                      product?.price.toString() ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: product?.compventa == "SELL"
                              ? Colors.red
                              : Colors.blue),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 90,
                  height: 25,
                  child: ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                        Clipboard.setData(
                          ClipboardData(text: product?.price.toString() ?? ''),
                        );
                      },
                      child: Text("copiar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: product?.compventa == "SELL"
                                ? Colors.red
                                : Colors.blue,
                            fontSize: 10,
                          ))),
                )
              ],
            ),
          );
  }

  Widget _sl() {
    return product?.sl.toString() == "0.0"
        ? Container()
        : Container(
            margin: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Container(
                    width: 53,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'SL:',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 120,
                    child: Text(
                        product!.sl.toString() +
                                '(' +
                                ((product!.price - product!.sl!).abs())
                                    .toStringAsFixed(0) +
                                ")PT" ??
                            '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.red))),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width:90,
                  height: 25,
                  child: ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                        Clipboard.setData(
                            ClipboardData(text: product?.sl.toString() ?? ''));
                      },
                      child: Text("copiar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 10))),
                )
              ],
            ),
          );
  }

  Widget _tp1() {
    return product?.tp1.toString() == "0.0"
        ? Container()
        : Container(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            margin: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Container(
                    width: 53,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'TP1:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 120,
                    child: Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      product!.tp1.toString() +
                          '(' +
                          ((product!.price - product!.tp1!).abs())
                              .toStringAsFixed(0) +
                          ")PT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 90,
                  height: 25,
                  child: product?.tpactivate1 != true
                      ? ElevatedButton(
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(
                                  text: product?.tp1.toString() ?? ''),
                            );
                            Fluttertoast.showToast(
                                msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                          },
                          child: Text("copiar",
                              style: TextStyle(
                                  color: product?.compventa == "SELL"
                                      ? Colors.red
                                      : Colors.blue,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold)))
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

  Widget _tp2() {
    return product?.tp2.toString() == "0.0"
        ? Container()
        : Container(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            margin: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Container(
                    width: 53,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'TP2:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 120,
                    child: Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      product!.tp2.toString() +
                              '(' +
                              ((product!.price - product!.tp2!).abs())
                                  .toStringAsFixed(0) +
                              ")PT" ??
                          '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 90,
                  height: 25,
                  child: product?.tpactivate2 != true
                      ? ElevatedButton(
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(
                                  text: product?.tp2.toString() ?? ''),
                            );
                            Fluttertoast.showToast(
                                msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                          },
                          child: Text("copiar",
                              style: TextStyle(
                                  color: product?.compventa == "SELL"
                                      ? Colors.red
                                      : Colors.blue,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold)))
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

  Widget _tp3() {
    return product?.tp3.toString() == "0.0"
        ? Container()
        : Container(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            margin: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Container(
                    width: 53,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'TP3:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 120,
                    child: Text(
                      product!.tp3.toString() +
                              '(' +
                              ((product!.price - product!.tp3!).abs())
                                  .toStringAsFixed(0) +
                              ")PT" ??
                          '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 90,
                  height: 25,
                  child: product?.tpactivate3 != true
                      ? ElevatedButton(
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(
                                  text: product?.tp3.toString() ?? ''),
                            );
                            Fluttertoast.showToast(
                                msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                          },
                          child: Text("copiar",
                              style: TextStyle(
                                  color: product?.compventa == "SELL"
                                      ? Colors.red
                                      : Colors.blue,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold)))
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

  Widget _tp4() {
    return product?.tp4.toString() == "0.0"
        ? Container()
        : Container(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            margin: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Container(
                    width: 53,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'TP4:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 120,
                    child: Text(
                      product!.tp4.toString() +
                              '(' +
                              ((product!.price - product!.tp4!).abs())
                                  .toStringAsFixed(0) +
                              ")PT" ??
                          '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 90,
                  height: 25,
                  child: product?.tpactivate4 != true
                      ? ElevatedButton(
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(
                                  text: product?.tp4.toString() ?? ''),
                            );
                            Fluttertoast.showToast(
                                msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                          },
                          child: Text("copiar",
                              style: TextStyle(
                                  color: product?.compventa == "SELL"
                                      ? Colors.red
                                      : Colors.blue,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold)))
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

  Widget _tp5() {
    return product?.tp5.toString() == "0.0"
        ? Container()
        : Container(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
            child: Row(
              children: [
                Container(
                    width: 53,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'TP5:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 120,
                    child: Text(
                      product!.tp5.toString() +
                              '(' +
                              ((product!.price - product!.tp5!).abs())
                                  .toStringAsFixed(0) +
                              ")TP" ??
                          '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 90,
                  height: 25,
                  child: product?.tpactivate5 != true
                      ? ElevatedButton(
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(
                                  text: product?.tp5.toString() ?? ''),
                            );
                            Fluttertoast.showToast(
                                msg: 'copiado', toastLength: Toast.LENGTH_LONG);
                          },
                          child: Text("copiar",
                              style: TextStyle(
                                  color: product?.compventa == "SELL"
                                      ? Colors.red
                                      : Colors.blue,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold)))
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
}
