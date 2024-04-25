import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/SelectOptionImageDialog.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/create/bloc/ProfProductCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/create/bloc/ProfProductCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/create/bloc/ProfProductCreateState.dart';

import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultTextField.dart';

class ProfProductCreateContent extends StatelessWidget {
  ProfProductCreateBloc? bloc;
  ProfProductCreateState state;

  ProfProductCreateContent(this.bloc, this.state);
  static const List<String> list = <String>['BUY', 'SELL'];
  static const List<String> listestado = <String>[
    'ACTIVO',
    'CERRADA',
    'PENDIENTE'
  ];

  String compraventaValue = list.first;
  String estadocombo = listestado.first;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // _imageProductOne(context),
                    SizedBox(
                      width: 10,
                    ),
                    _imageProductTwo(context),
                  ],
                ),
                _cardproductForm(context),
              ],
            ),
          ),
          DefaultIconBack(left: 15, top: 50)
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

  // Widget _imageProductOne(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       SelectOptionImageDialog(context, () {
  //         bloc?.add(ProductUpdatePickImage(numberfile: 1));
  //       }, () {
  //         bloc?.add(ProductUpdateTakePhoto(numberfile: 1));
  //       });
  //     },
  //     child: Container(
  //       width: 150,
  //       margin: EdgeInsets.only(top: 40),
  //       child: AspectRatio(
  //         aspectRatio: 1 / 1,
  //         child: ClipOval(
  //             child: state.file1 != null
  //                 ? Image.file(
  //                     state.file1!,
  //                     fit: BoxFit.cover,
  //                   )
  //                 : Image.asset(
  //                     'assets/img/no-image.png',
  //                     fit: BoxFit.cover,
  //                   )),
  //       ),
  //     ),
  //   );
  // }

  Widget _imageProductTwo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(context, () {
          bloc?.add(ProductUpdatePickImage(numberfile: 2));
        }, () {
          bloc?.add(ProductUpdateTakePhoto(numberfile: 2));
        });
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
              child: state.file2 != null
                  ? Image.file(
                      state.file2!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/img/no-image.png',
                      fit: BoxFit.cover,
                    )),
        ),
      ),
    );
  }

  Widget _cardproductForm(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35),
      child: Column(children: [
        _textNewProduct(),
        Row(
          children: [
            _textFielPrice(),
            Spacer(),
            _textFielPrice1(),
          ],
        ),
        Row(
          children: [
            _textFielPrice2(),
            Spacer(),
            _textsl(),
          ],
        ),
        _textFielDescription(),
        Row(
          children: [
            _combocompraventa(),
            Spacer(),
            _comboestado(),
          ],
        ),
        Row(
          children: [_textFieltp1(), _textFieltp2(), _textFieltp3()],
        ),
        Row(
          children: [
            _textFieltp4(),
            _textFieltp5(),
          ],
        ),
        _fabSubmit()
      ]),
    );
  }

  Widget _comboestado() {
    return DropdownButton<String>(
      value: state.estad.value.isEmpty ? estadocombo : state.estad.value,
      elevation: 16,
      style: const TextStyle(color: Colors.red),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        bloc?.add(EstadChanged(estad: BlocForItem(value: value.toString())));

        print(value);
      },
      items: listestado.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _combocompraventa() {
    return DropdownButton<String>(
      value: state.compventa.value.isEmpty
          ? compraventaValue
          : state.compventa.value,
      elevation: 16,
      style: const TextStyle(color: Colors.red),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        bloc?.add(
            CompventaChanged(compventa: BlocForItem(value: value.toString())));
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _textFielDescription() {
    return DefaultTextField(
      label: 'descripcion',
      icon: Icons.description,
      onChanged: (text) {
        bloc?.add(DescriptionChanged(description: BlocForItem(value: text)));
      },
      color: Colors.white,
    );
  }

  Widget _textFielPrice() {
    return Container(
        width: 130,
        child: TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              bloc?.add(PriceChanged(price: BlocForItem(value: text)));
            },
            validator: (value) {
              return state.price.error;
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
            ],
            decoration: InputDecoration(
                label: Text(
                  "Punto1",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                hintText: "00.0",
                icon: Icon(Icons.numbers, color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )))));
  }

  Widget _textsl() {
    return Container(
        width: 130,
        child: TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              bloc?.add(SlChanged(sl: BlocForItem(value: text)));
            },
            validator: (value) {
              return state.sl?.error;
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
            ],
            decoration: InputDecoration(
                label: Text(
                  "SL",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                hintText: "00.0",
                icon: Icon(Icons.numbers, color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )))));
  }

  Widget _textFielPrice1() {
    return Container(
        width: 130,
        child: TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              bloc?.add(Price1Changed(price1: BlocForItem(value: text)));
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
            ],
            decoration: InputDecoration(
                label: Text(
                  "Punto2",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                hintText: "00.0",
                icon: Icon(Icons.numbers, color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )))));
  }

  Widget _textFielPrice2() {
    return Container(
        width: 130,
        child: TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              bloc?.add(Price2Changed(price2: BlocForItem(value: text)));
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
            ],
            decoration: InputDecoration(
                label: Text(
                  "Punto3",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                hintText: "00.0",
                icon: Icon(Icons.numbers, color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )))));
  }

  Widget _textFieltp1() {
    return Container(
        width: 90,
        margin: EdgeInsets.only(left: 10),
        child: TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              bloc?.add(Tp1Changed(tp1: BlocForItem(value: text)));
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
            ],
            decoration: InputDecoration(
                label: Text(
                  "TP 1",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                hintText: "00.0",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )))));
  }

  Widget _textFieltp2() {
    return Container(
        width: 90,
        margin: EdgeInsets.only(left: 10),
        child: TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              bloc?.add(Tp2Changed(tp2: BlocForItem(value: text)));
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
            ],
            decoration: InputDecoration(
                label: Text(
                  "TP 2",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                hintText: "00.0",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )))));
  }

  Widget _textFieltp3() {
    return Container(
        width: 90,
        margin: EdgeInsets.only(left: 10),
        child: TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              bloc?.add(Tp3Changed(tp3: BlocForItem(value: text)));
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
            ],
            decoration: InputDecoration(
                label: Text(
                  "TP 3",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                hintText: "00.0",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )))));
  }

  Widget _textFieltp4() {
    return Container(
        width: 90,
        margin: EdgeInsets.only(left: 10),
        child: TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              bloc?.add(Tp4Changed(tp4: BlocForItem(value: text)));
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
            ],
            decoration: InputDecoration(
                label: Text(
                  "TP 4",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                hintText: "00.0",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )))));
  }

  Widget _textFieltp5() {
    return Container(
        width: 90,
        margin: EdgeInsets.only(left: 10),
        child: TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              bloc?.add(Tp5Changed(tp5: BlocForItem(value: text)));
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
            ],
            decoration: InputDecoration(
                label: Text(
                  "TP 5",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                hintText: "00.0",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )))));
  }

  Widget _textFielestado() {
    return Container(
      width: 90,
      margin: EdgeInsets.only(left: 10),
      child: DefaultTextField(
        label: 'Estado',
        icon: Icons.description,
        onChanged: (text) {
          bloc?.add(EstadChanged(estad: BlocForItem(value: text)));
        },
        textInputType: TextInputType.number,
        validator: (value) {
          return state.estad.error;
        },
        color: Colors.white,
      ),
    );
  }

  Widget _textNewProduct() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10, bottom: 10),
      child: Text(
        'NUEVO SEÑAL',
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _fabSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 30),
      child: FloatingActionButton(
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(FormSubmit());
          }
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
