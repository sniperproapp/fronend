import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/User.dart';

class ProfileInfoContent extends StatelessWidget {
  User? user;

  ProfileInfoContent(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/fondodrawel.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              _imagenprofile(),
              Spacer(),
              _cardProfile(context),
            ],
          )
        ],
      ),
    );
  }

  Widget _imageBackgraund(BuildContext context) {
    return Image.asset(
      'assets/img/fondodrawel.png',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _imagenprofile() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 200,
      child: user != null
          ? AspectRatio(
              aspectRatio: 1 / 1,
              child: ClipOval(
                child: user!.imagen! != null
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/img/user.png',
                        image: user!.imagen!,
                        fit: BoxFit.cover,
                        fadeInDuration: Duration(seconds: 1),
                      )
                    : Image.asset(
                        'assets/img/no-image.png',
                        fit: BoxFit.cover,
                      ),
              ),
            )
          : Container(),
    );
  }

  Widget _cardProfile(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          ListTile(
            textColor: Colors.white,
            title: Text('${user?.name ?? ''} ${user?.lastname ?? ''}'),
            subtitle: Text('Nombre de usuario'),
            leading: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          ListTile(
            textColor: Colors.white,
            title: Text('${user?.email ?? ''}'),
            subtitle: Text('Email'),
            leading: Icon(Icons.email, color: Colors.white),
          ),
          ListTile(
            textColor: Colors.white,
            title: Text('${user?.phone ?? ''}'),
            subtitle: Text('Telefono'),
            leading: Icon(
              Icons.phone,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 10),
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, 'profile/update', arguments: user);
              },
              child: Icon(Icons.edit),
            ),
          )
        ]),
      ),
    );
  }
}
