import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/SelectOptionImageDialog.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/update/bloc/ProfProductUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/update/bloc/ProfProductUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/update/bloc/ProfProductUpdateState.dart';

import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultTextField.dart';

class ProfProductUpdateContent extends StatelessWidget {
  ProfProductUpdateBloc? bloc;
  ProfProductUpdateState state;
  Product? product;

  ProfProductUpdateContent(this.bloc, this.state, this.product);
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
                      width: 20,
                    ),
                    _imageProductTwo(context),
                  ],
                ),
                _cardproductForm(context)
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

  Widget _imageProductOne(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(context, () {
          bloc?.add(ProductUpdatePickImage(numberfile: 1));
        }, () {
          bloc?.add(ProductUpdateTakePhoto(numberfile: 1));
        });
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
              child: state.file1 != null
                  ? Image.file(
                      state.file1!,
                      fit: BoxFit.cover,
                    )
                  : product != null
                      ? FadeInImage.assetNetwork(
                          placeholder: 'assets/img/user.png',
                          image: product!.image1!,
                          fit: BoxFit.cover,
                          fadeInDuration: Duration(seconds: 1),
                        )
                      : Image.asset(
                          'assets/img/no-image.png',
                          fit: BoxFit.cover,
                        )),
        ),
      ),
    );
  }

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
                  : product != null
                      ? FadeInImage.assetNetwork(
                          placeholder: 'assets/img/user.png',
                          image: product!.image2!,
                          fit: BoxFit.cover,
                          fadeInDuration: Duration(seconds: 1),
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
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
        _textNewProduct(),
        Row(
          children: [
            _textFielPrice(),
            _textFielPrice1(),
            _textFielPrice2(),
          ],
        ),
        _textFielDescription(),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              _textFielsl(),
              _combocompraventa(),
              _comboestado(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              _textFielTp1(),
              _textFielTp2(),
              _textFielTp3(),
            ],
          ),
        ),
        Row(
          children: [
            _textFielTp4(),
            _textFielTp5(),
          ],
        ),

        // _textFielName(),

        _fabSubmit()
      ]),
    );
  }

  Widget _textFielTp1() {
    return Container(
      width: 100,
      margin: EdgeInsets.only(left: 10),
      child: DefaultTextField(
        label: 'TP 1',
        icon: Icons.numbers,
        inicialvalue: product?.tp1.toString() ?? '',
        onChanged: (text) {
          bloc?.add(Tp1Changed(tp1: BlocForItem(value: text)));
        },
        textInputType: TextInputType.number,
        validator: (value) {
          return state.tp1.error;
        },
        color: Colors.black,
      ),
    );
  }

  Widget _textFielTp2() {
    return Container(
      width: 100,
      margin: EdgeInsets.only(left: 10),
      child: DefaultTextField(
        label: 'TP 2',
        icon: Icons.numbers,
        inicialvalue: product?.tp2.toString() ?? '',
        onChanged: (text) {
          bloc?.add(Tp2Changed(tp2: BlocForItem(value: text)));
        },
        textInputType: TextInputType.number,
        validator: (value) {
          return state.tp2.error;
        },
        color: Colors.black,
      ),
    );
  }

  Widget _textFielTp3() {
    return Container(
      width: 100,
      margin: EdgeInsets.only(left: 10),
      child: DefaultTextField(
        label: 'TP 3',
        icon: Icons.numbers,
        inicialvalue: product?.tp3.toString() ?? '',
        onChanged: (text) {
          bloc?.add(Tp3Changed(tp3: BlocForItem(value: text)));
        },
        textInputType: TextInputType.number,
        validator: (value) {
          return state.tp3.error;
        },
        color: Colors.black,
      ),
    );
  }

  Widget _textFielTp4() {
    return Container(
      width: 100,
      margin: EdgeInsets.only(left: 10),
      child: DefaultTextField(
        label: 'TP 4',
        icon: Icons.numbers,
        inicialvalue: product?.tp4.toString() ?? '',
        onChanged: (text) {
          bloc?.add(Tp4Changed(tp4: BlocForItem(value: text)));
        },
        textInputType: TextInputType.number,
        validator: (value) {
          return state.tp4.error;
        },
        color: Colors.black,
      ),
    );
  }

  Widget _textFielTp5() {
    return Container(
      width: 100,
      margin: EdgeInsets.only(left: 10),
      child: DefaultTextField(
        label: 'TP 5',
        icon: Icons.numbers,
        inicialvalue: product?.tp5.toString() ?? '',
        onChanged: (text) {
          bloc?.add(Tp5Changed(tp5: BlocForItem(value: text)));
        },
        textInputType: TextInputType.number,
        validator: (value) {
          return state.tp5.error;
        },
        color: Colors.black,
      ),
    );
  }

  Widget _comboestado() {
    return Container(
      margin: EdgeInsets.only(left: 35),
      child: DropdownButton<String>(
        value: state.estad.value.isEmpty ? estadocombo : state.estad.value,
        elevation: 16,
        style: const TextStyle(color: Colors.red),
        underline: Container(
          height: 2,
          color: Colors.white,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          bloc?.add(EstadChanged(estad: BlocForItem(value: value!)));

          print(value);
        },
        items: listestado.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _combocompraventa() {
    return Container(
      margin: EdgeInsets.only(left: 25),
      child: DropdownButton<String>(
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
          bloc?.add(CompventaChanged(compventa: BlocForItem(value: value!)));

          print(value);
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _textFielName() {
    return DefaultTextField(
      label: 'nombre del producto',
      icon: Icons.category,
      inicialvalue: product?.name ?? '',
      onChanged: (text) {
        bloc?.add(NameChanged(name: BlocForItem(value: text)));
      },
      validator: (value) {
        return state.name.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFielDescription() {
    return DefaultTextField(
      label: 'descripcion',
      icon: Icons.description,
      inicialvalue: product?.description ?? '',
      onChanged: (text) {
        bloc?.add(DescriptionChanged(description: BlocForItem(value: text)));
      },
      validator: (value) {
        return state.description.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFielPrice() {
    return Container(
      width: 100,
      margin: EdgeInsets.only(left: 10),
      child: DefaultTextField(
        label: 'Price 1',
        icon: Icons.numbers,
        inicialvalue: product?.price.toString() ?? '',
        onChanged: (text) {
          bloc?.add(PriceChanged(price: BlocForItem(value: text)));
        },
        textInputType: TextInputType.number,
        validator: (value) {
          return state.price.error;
        },
        color: Colors.black,
      ),
    );
  }

  Widget _textFielsl() {
    return Container(
      width: 100,
      margin: EdgeInsets.only(left: 10),
      child: DefaultTextField(
        label: 'SL',
        icon: Icons.numbers,
        inicialvalue: product?.sl.toString() ?? '',
        onChanged: (text) {
          bloc?.add(SlChanged(sl: BlocForItem(value: text)));
        },
        textInputType: TextInputType.number,
        validator: (value) {
          return state.sl.error;
        },
        color: Colors.black,
      ),
    );
  }

  Widget _textFielPrice1() {
    return Container(
      width: 100,
      margin: EdgeInsets.only(left: 10),
      child: DefaultTextField(
        label: 'Price 2',
        icon: Icons.numbers,
        inicialvalue: product?.price1.toString() ?? '',
        onChanged: (text) {
          bloc?.add(Price1Changed(price1: BlocForItem(value: text)));
        },
        textInputType: TextInputType.number,
        validator: (value) {
          return state.price1.error;
        },
        color: Colors.black,
      ),
    );
  }

  Widget _textFielPrice2() {
    return Container(
      width: 100,
      margin: EdgeInsets.only(left: 10),
      child: DefaultTextField(
        label: 'Price 3',
        icon: Icons.numbers,
        inicialvalue: product?.price2.toString() ?? '',
        onChanged: (text) {
          bloc?.add(Price2Changed(price2: BlocForItem(value: text)));
        },
        textInputType: TextInputType.number,
        validator: (value) {
          return state.price2.error;
        },
        color: Colors.black,
      ),
    );
  }

  Widget _textFielSl() {
    return DefaultTextField(
      label: 'SL',
      icon: Icons.numbers,
      inicialvalue: product?.sl.toString() ?? '',
      onChanged: (text) {
        bloc?.add(SlChanged(sl: BlocForItem(value: text)));
      },
      textInputType: TextInputType.number,
      validator: (value) {
        return state.sl.error;
      },
      color: Colors.black,
    );
  }

  Widget _textNewProduct() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10, bottom: 10),
      child: Text(
        'EDITAR SEÑAL',
        style: TextStyle(fontSize: 17),
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
