import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/main.dart';
import 'package:sniper_pro/src/blocProvider.dart';
import 'package:sniper_pro/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/list/ProfCategoryListPage.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/home/bloc/ProfHomeBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/home/bloc/ProfHomeEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/home/bloc/ProfHomeState.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/mensajes/create/profMensajeCreatePage.dart';

import 'package:sniper_pro/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:sniper_pro/src/presentation/pages/roles/RolesPage.dart';

class ProfHomePage extends StatefulWidget {
  const ProfHomePage({super.key});

  @override
  State<ProfHomePage> createState() => _ProfHomePageState();
}

class _ProfHomePageState extends State<ProfHomePage> {
  ProfHomeBloc? _bloc;
  List<Widget> pageList = <Widget>[
    ProfCategoryListPage(),
    ProfileInfoPage(),
    RolesPage(),
     profMensajeCreatePage(),

    //  ProfreportePage(),
  ]; //lista dw widged

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ProfHomeBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(2, 10, 158, 1),
          title: Text(
            'MENU TRADER',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer:
            BlocBuilder<ProfHomeBloc, ProfHomeState>(builder: (context, state) {
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
                        title: Text('Categorias'),
                        selected: state.pageIndex == 0,
                        textColor: Colors.white,
                        onTap: () {
                          _bloc?.add(ProfChangeDrawerPage(pageIndex: 0));
                          Navigator.pop(context);
                        },
                      ),
                      // ListTile(
                      //   title: Text('Señales'),
                      //   selected: state.pageIndex == 1,
                      //   onTap: () {
                      //     _bloc?.add(ProfChangeDrawerPage(pageIndex: 1));
                      //     Navigator.pop(context);
                      //   },
                      // ),
                      ListTile(
                        leading: Image.asset(
                          'assets/img/ICONOPERFIL.png',
                          width: 25,
                          height: 25,
                        ),
                        title: Text('Usuario'),
                        selected: state.pageIndex == 1,
                        textColor: Colors.white,
                        onTap: () {
                          _bloc?.add(ProfChangeDrawerPage(pageIndex: 1));
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
                        selected: state.pageIndex == 2,
                        onTap: () {
                          _bloc?.add(ProfChangeDrawerPage(pageIndex: 2));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                  leading: Image.asset(
                    'assets/img/ICONOROLES.png',
                    width: 25,
                    height: 25,
                  ),
                  title: Text('MENSAJES', style: TextStyle(color: Colors.blue)),
                  selected: state.pageIndex == 3,
                  onTap: () {
                    _bloc?.add(ProfChangeDrawerPage(pageIndex: 3));
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
                        selected: state.pageIndex == 4,
                        textColor: Colors.white,
                        onTap: () async {
                          _bloc?.add(ProfLogout());
                          await Future.delayed(Duration(seconds: 3));
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                              (route) => false);
                        },
                      ),

                      Container(
                          width: 200,
                          margin: EdgeInsets.only(top: 250),
                          child: Center(
                            child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: ClipOval(
                                    child: Container(
                                  width: 70,
                                  child: Image.asset(
                                    'assets/img/logo_sniper.png',
                                    fit: BoxFit.cover,
                                  ),
                                ))),
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
        body: BlocBuilder<ProfHomeBloc, ProfHomeState>(
          builder: (context, state) {
            return pageList[state.pageIndex];
          },
        ));
  }
}
