import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/main.dart';
import 'package:sniper_pro/src/presentation/pages/client/category/list/ClientCategoryListPage.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/ClientProductDescargoPage.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeState.dart';
import 'package:sniper_pro/src/presentation/pages/client/ranking/list/ClientrankingListPage.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/ClientvideoPage.dart';
import 'package:sniper_pro/src/presentation/pages/client/zoom/ClientzoomPage.dart';
import 'package:sniper_pro/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:sniper_pro/src/presentation/pages/roles/RolesPage.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  ClientHomeBloc? _bloc;
  List<Widget> pageList = <Widget>[
    ClientCategoryListPage(),
    ProfileInfoPage(),
    ClientrankingListPage(),
    RolesPage(),
    ClientvideoPage(),
    ClientProductDescargoPage(),
    ClientzoomPage()
  ];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientHomeBloc>(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Menu',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(2, 10, 158, 1),
        ),
        drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
            builder: (context, state) {
          return Drawer(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    child: Container(
                  child: Row(
                    children: [
                      Container(
                          width: 80,
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: ClipOval(
                                  child: Container(
                                width: 70,
                                child: state.user!.imagen! != null
                                    ? FadeInImage.assetNetwork(
                                        placeholder: 'assets/img/user.png',
                                        image: state.user!.imagen!,
                                        fit: BoxFit.cover,
                                        fadeInDuration: Duration(seconds: 1),
                                      )
                                    : Image.asset(
                                        'assets/img/no-image.png',
                                        fit: BoxFit.cover,
                                      ),
                              )))),
                      Container(
                        margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                        child: Column(
                          children: [
                            Text(
                              state.user!.name ?? 'Cliente',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              state.user!.lastname,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          'assets/img/ICONOSEÑALES.png',
                          width: 25,
                          height: 25,
                        ),
                        title: Text('Señales'),
                        textColor: Colors.white,
                        selected: state.pageIndex == 0,
                        onTap: () {
                          _bloc?.add(ChangeDrawerPage(
                              pageIndex: state.user?.descargo == 1 ? 0 : 5));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/img/ICONOPERFIL.png',
                          width: 25,
                          height: 25,
                        ),
                        title: Text('Perfil'),
                        textColor: Colors.white,
                        selected: state.pageIndex == 1,
                        onTap: () {
                          _bloc?.add(ChangeDrawerPage(
                              pageIndex: state.user?.descargo == 1 ? 1 : 5));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/img/ICONORANKING.png',
                          width: 25,
                          height: 25,
                        ),
                        title: Text('Ranking'),
                        textColor: Colors.white,
                        selected: state.pageIndex == 2,
                        onTap: () {
                          _bloc?.add(ChangeDrawerPage(
                              pageIndex: state.user?.descargo == 1 ? 2 : 5));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/img/ICONOROLES.png',
                          width: 25,
                          height: 25,
                        ),
                        title: Text('Roles'),
                        textColor: Colors.white,
                        selected: state.pageIndex == 3,
                        onTap: () {
                          _bloc?.add(ChangeDrawerPage(
                              pageIndex: state.user?.descargo == 1 ? 3 : 5));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/img/ICONOAYUDA.png',
                          width: 25,
                          height: 25,
                        ),
                        title: Text('Ayuda'),
                        textColor: Colors.white,
                        selected: state.pageIndex == 4,
                        onTap: () {
                          _bloc?.add(ChangeDrawerPage(
                              pageIndex: state.user?.descargo == 1 ? 4 : 5));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/img/ICONODESCARGO.png',
                          width: 25,
                          height: 25,
                        ),
                        title: Text('Descargo de Responsabilidad'),
                        textColor: Colors.red,
                        selected: state.pageIndex == 5,
                        onTap: () {
                          _bloc?.add(ChangeDrawerPage(pageIndex: 5));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/img/ICONODESCARGO.png',
                          width: 25,
                          height: 25,
                        ),
                        title: Text('ZOOM'),
                        textColor: Colors.blue,
                        selected: state.pageIndex == 6,
                        onTap: () {
                          _bloc?.add(ChangeDrawerPage(pageIndex: 6));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/img/CERRARSESION.png',
                          width: 25,
                          height: 25,
                        ),
                        title: Text('Cerrar sesion'),
                        textColor: Colors.white,
                        onTap: () async {
                          _bloc?.add(logout());
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                              (route) => false);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 70,
                            child: IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse("https://wa.link/8uge7s"));
                              },
                              icon: Image.asset(
                                'assets/img/LOGOWHATSAPP.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            child: IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    "https://track.deriv.com/_kQiHwaQEDiUv_52HWb4YL2Nd7ZgqdRLk/1/"));
                              },
                              icon: Image.asset(
                                'assets/img/deriv.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 70,
                        child: IconButton(
                          onPressed: () {
                            launchUrl(Uri.parse(
                                "https://www.instagram.com/miguelmonsalve_fx_lamaquina?utm_source=ig_web_button_share_sheet&igsh=ODdmZWVhMTFiMw=="));
                          },
                          icon: Image.asset(
                            'assets/img/INSTAGRAM.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: ClipOval(
                                child: Image.asset(
                              'assets/img/logo_sniper.png',
                              fit: BoxFit.cover,
                            ))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
        body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
            builder: (context, state) {
          return pageList[state.pageIndex!];
        }));
  }
}
