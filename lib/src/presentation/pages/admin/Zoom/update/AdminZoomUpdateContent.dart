import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/Zoom.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/SelectOptionImageDialog.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/bloc/AdminZoomUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/bloc/AdminZoomUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/bloc/AdminZoomUpdateState.dart';

import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultTextField.dart';

class AdminZoomUpdateContent extends StatelessWidget {
  AdminZoomUpdateBloc? bloc;
  AdminZoomUpdateState state;
  Zoom? zoom;

  AdminZoomUpdateContent(this.bloc, this.state, this.zoom);

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
                children: [_imageCategory(context), _cardCategoriForm(context)],
              ),
            ),
          ),
          DefaultIconBack(left: 15, top: 50)
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

  Widget _imageCategory(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(context, () {
          bloc?.add(ZoomUpdatePickImage());
        }, () {
          bloc?.add(ZoomUpdateTakePhoto());
        });
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 90),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
              child: state.file != null
                  ? Image.file(
                      state.file!,
                      fit: BoxFit.cover,
                    )
                  : zoom != null
                      ? FadeInImage.assetNetwork(
                          placeholder: 'assets/img/user.png',
                          image: zoom!.imagen!,
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

  Widget _cardCategoriForm(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.4),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: Column(children: [
          _textNewCategory(),
          _textFielName(),
          _textFielLink(),
          _textFielDescription(),
          _fabSubmit()
        ]),
      ),
    );
  }

  Widget _textFielName() {
    return DefaultTextField(
      label: 'nombre del Zoom',
      icon: Icons.category,
      inicialvalue: zoom!.name,
      onChanged: (text) {
        bloc?.add(NameChanged(name: BlocForItem(value: text)));
      },
      validator: (value) {
        return state.name.error;
      },
      color: Colors.white,
    );
  }

  Widget _textFielLink() {
    return DefaultTextField(
      label: 'link del Zoom',
      icon: Icons.link,
      inicialvalue: zoom!.link,
      onChanged: (text) {
        bloc?.add(LinkChanged(link: BlocForItem(value: text)));
      },
      validator: (value) {
        return state.link.error;
      },
      color: Colors.white,
    );
  }

  Widget _textFielDescription() {
    return DefaultTextField(
      label: 'descripcion',
      icon: Icons.description,
      inicialvalue: zoom?.description,
      onChanged: (text) {
        bloc?.add(descriptionChanged(description: BlocForItem(value: text)));
      },
      validator: (value) {
        return state.description.error;
      },
      color: Colors.white,
    );
  }

  Widget _textNewCategory() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10, bottom: 10),
      child: Text(
        'UPDATE ZOOM',
        style: TextStyle(fontSize: 17, color: Colors.white),
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
