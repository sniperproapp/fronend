import 'package:flutter/material.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
 
import 'package:sniper_pro/src/presentation/pages/admin/mensajes/create/bloc/AdminMensajeCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/mensajes/create/bloc/AdminMensajeCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/mensajes/create/bloc/AdminMensajeCreateState.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaulTextFormField.dart';
 
 
import 'package:sniper_pro/src/presentation/widgets/DefaultTextField.dart';

// ignore: must_be_immutable
class AdminMensajeCreateContent extends StatelessWidget {
  AdminMensajeCreateBloc? bloc;
  AdminMensajeCreateState state;

  AdminMensajeCreateContent(this.bloc, this.state);
//const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ _cardCategoriForm(context)],
              ),
            ),
          ),
           
        ],
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/fondodrawel.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.4),
      colorBlendMode: BlendMode.darken,
    );
  }

  

  Widget _cardCategoriForm(BuildContext context) {
    return Container(
      
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(children: [
          _textNewMensaje(),
          _textFielName(),
          _textFielDescription(),
          _fabSubmit()
        ]),
      ),
    );
  }

  Widget _textFielName() {
    return DefaultTextField(
      label: 'TITULO',
      icon: Icons.message,
      onChanged: (text) {
        bloc?.add(TituloChanged(titulo: BlocForItem(value: text)));
      },
      validator: (value) {
        return state.titulo.error;
      },
      color: Colors.white,
    );
  }

  Widget _textFielDescription() {
    return DefaulTextFormField(
      label: 'descripcion',
      icon: Icons.description,
      onChanged: (text) {
        bloc?.add(descriptionChanged(description: BlocForItem(value: text)));
      },
      validator: (value) {
        return state.description.error;
      },
      color: Colors.white,
    );
  }

  Widget _textNewMensaje() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10, bottom: 10),
      child: Text(
        'NUEVO MENSAJE',
        style: TextStyle(fontSize: 17, color: Colors.white),
      ),
    );
  }

  Widget _fabSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 90),
      child: FloatingActionButton(
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(FormSubmit( ));
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
