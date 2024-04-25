import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/bloc/clientproducdescargoState.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/bloc/clientproductdescargoBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/bloc/clientproductdescargoEvent.dart';

import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';

class ClientProductDescargoContent extends StatelessWidget {
  clientproductdescargoBloc? _bloc;
  clientproducdescargoState? state;
  ClientProductDescargoContent(this._bloc, this.state);

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
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Column(
                    children: [
                      _textname(),
                      _textparrafo1(context),
                      _textparrafo2(context),
                      _textparrafo3(context),
                      _textparrafo4(context),
                      _boton(context)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textname() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        'DESCARGO DE RESPONSABILIDAD',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _textparrafo1(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Text(
        'La negociación en los mercados financieros conlleva un alto nivel de riesgo y no es adecuada para todos los inversores. Un alto apalancamiento puede funcionar tanto a su favor como en desventaja',
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _textparrafo2(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Text(
        'Antes de tomar una decisión sobre el comercio de Divisas, un inversor debe considerar cuidadosamente sus objetivos, experiencia y nivel de riesgo.',
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _textparrafo3(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Text(
        'Es posible perder parte o todo el capital inicial invertido. Por lo tanto, no debes invertir dinero que no puedas permitirte perder.',
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _textparrafo4(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Text(
        'El inversor debe ser consciente de los riesgos asociados con el comercio de Divisas y, en caso de duda, tratar de buscar ayuda de un asesor financiero independiente.',
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _boton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: ElevatedButton(
          onPressed: () {
            _bloc?.add(aceptardescargo());
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(2, 10, 158, 1)),
          child:
              Text(state!.respuesta!, style: TextStyle(color: Colors.white))),
    );
  }
}
