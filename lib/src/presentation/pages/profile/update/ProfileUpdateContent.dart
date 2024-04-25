import 'package:flutter/material.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';
import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/presentation/Utils/SelectOptionImageDialog.dart';
import 'package:sniper_pro/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultTextField.dart';

class ProfileUpdateContent extends StatelessWidget {
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;
  User? user;

  ProfileUpdateContent(this.user, this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/fondodrawel.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _imagenprofile(context),
                    //Spacer(),
                    _cardProfile(context),
                  ],
                ),
              ),
            ),
            DefaultIconBack(left: 15, top: 50)
          ],
        ),
      ),
    );
  }

  Widget _imagenprofile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // bloc?.add(ProfileUpdatePickImage());
        //bloc?.add(ProfileUpdateTakePhoto());
        SelectOptionImageDialog(context, () {
          bloc?.add(ProfileUpdatePickImage());
        }, () {
          bloc?.add(ProfileUpdateTakePhoto());
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: 200,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
            child: state.image != null
                ? Image.file(
                    state.image!,
                    fit: BoxFit.cover,
                  )
                : FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image: user!.imagen!,
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _cardProfile(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.4),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          _textUpdateInfo(),
          _textFieldname(),
          _textFieldlastname(),
          _textFieldphone(),
          _fabSubmit()
        ]),
      ),
    );
  }

  Widget _textFieldname() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'nombre',
        color: Colors.white,
        icon: Icons.person,
        inicialvalue: user?.name ?? '',
        //errorText: snapshot.error?.toString(),
        onChanged: (text) {
          bloc?.add(ProfileUpdateNameChange(name: BlocForItem(value: text)));
        },

        validator: (value) {
          return state.name.error;
        },
      ),
    );
  }

  Widget _textUpdateInfo() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 25, left: 35, bottom: 10),
      child: Text(
        'ACTUALIZAR INFORMACION',
        style: TextStyle(fontSize: 17, color: Colors.white),
      ),
    );
  }

  Widget _fabSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 10, top: 20),
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          bloc?.add(profileupdateformsubmit());
        },
        child: Icon(Icons.check),
      ),
    );
  }

  Widget _textFieldlastname() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'apellido',
        color: Colors.white,
        icon: Icons.person_2,
        inicialvalue: user?.lastname ?? '',
        //errorText: snapshot.error?.toString(),
        onChanged: (text) {
          bloc?.add(
              ProfileUpdatelastnameChange(lastname: BlocForItem(value: text)));
        },

        validator: (value) {
          return state.lastname.error;
        },
      ),
    );
  }

  Widget _textFieldphone() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'telefono',
        color: Colors.white,
        inicialvalue: user?.phone ?? '',
        icon: Icons.phone,
        //errorText: snapshot.error?.toString(),
        onChanged: (text) {
          bloc?.add(ProfileUpdatephoneChange(phone: BlocForItem(value: text)));
        },

        validator: (value) {
          return state.phone.error;
        },
      ),
    );
  }
}
