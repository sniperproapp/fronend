import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/presentation/Utils/SelectOptionImageDialog.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateState.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultTextField.dart';

class AdminCategoryUpdateContent extends StatelessWidget {
  AdminCategoryUpdateBloc? bloc;
  AdminCategoryUpdateState state;
  Category? category;

  AdminCategoryUpdateContent(this.bloc, this.state, this.category);

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
          bloc?.add(CategoryUpdatePickImage());
        }, () {
          bloc?.add(CategoryUpdateTakePhoto());
        });
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
              child: state.file != null
                  ? Image.file(
                      state.file!,
                      fit: BoxFit.cover,
                    )
                  : category != null
                      ? FadeInImage.assetNetwork(
                          placeholder: 'assets/img/user.png',
                          image: category!.image!,
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
      height: MediaQuery.of(context).size.height * 0.48,
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.4),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: Column(children: [
          _textNewCategory(),
          _textFielName(),
          _textFielDescription(),
          _fabSubmit()
        ]),
      ),
    );
  }

  Widget _textFielName() {
    return DefaultTextField(
      label: 'nombre de la categoria',
      icon: Icons.category,
      inicialvalue: category!.name,
      onChanged: (text) {
        bloc?.add(NameChanged(name: BlocForItem(value: text)));
      },
      validator: (value) {
        return state.name.error;
      },
      color: Colors.white,
    );
  }

  Widget _textFielDescription() {
    return DefaultTextField(
      label: 'descripcion',
      icon: Icons.description,
      inicialvalue: category?.description,
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
        'NUEVA CATEGORIA',
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
