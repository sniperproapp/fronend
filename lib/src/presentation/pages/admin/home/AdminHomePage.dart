import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:sniper_pro/main.dart';
import 'package:sniper_pro/src/blocProvider.dart';
import 'package:sniper_pro/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/AdminZoomListPage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/AdminCategoryListPage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';
import 'package:sniper_pro/src/presentation/pages/admin/mensajes/create/AdminMensajeCreatePage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/AdminProducListPage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/reporte/adminreportePage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/AdminUserListPage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/bloc/AdminUserListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/bloc/AdminUserListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:sniper_pro/src/presentation/pages/roles/RolesPage.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  AdminHomeBloc? _bloc;
  bool? _isSearching = false;
  TextEditingController? _searchController;
  List<Widget> pageList = <Widget>[
    AdminCategoryListPage(),
    ProfileInfoPage(),
    AdminUserListPage(),
    adminreportePage(),
    RolesPage(),
    AdminZoomListPage(),
    AdminMensajeCreatePage()
  ];

  onSearch() {
    return context
        .read<AdminUserListBloc>()
        .add(Getuser(busqueda: _searchController!.text));
  }

  onSearchCancel() {
    _searchController?.clear();
    _isSearching = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminHomeBloc>(context);

    return Scaffold(
        appBar: _isSearching == true
            ? getAppBarSearching(onSearchCancel, onSearch, _searchController!)
            : getAppBarNotSearching("MENU ADMIN", startSearching),
        drawer: BlocBuilder<AdminHomeBloc, AdminHomeState>(
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
                ListTile(
                  leading: Image.asset(
                    'assets/img/ICONOSEÑALES.png',
                    width: 25,
                    height: 25,
                  ),
                  title: Text(
                    'Categorias',
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    _bloc?.add(AdminChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ),
                // ListTile(
                //   title: Text('Señales'),
                //   selected: state.pageIndex == 1,
                //   onTap: () {
                //     _bloc?.add(AdminChangeDrawerPage(pageIndex: 1));
                //     Navigator.pop(context);
                //   },
                // ),
                ListTile(
                  leading: Image.asset(
                    'assets/img/ICONOPERFIL.png',
                    width: 25,
                    height: 25,
                  ),
                  title: Text(
                    'Usuario',
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: state.pageIndex == 1,
                  onTap: () {
                    _bloc?.add(AdminChangeDrawerPage(pageIndex: 1));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/img/ICONOROLES.png',
                    width: 25,
                    height: 25,
                  ),
                  title: Text('lista Usuario',
                      style: TextStyle(color: Colors.white)),
                  selected: state.pageIndex == 2,
                  onTap: () {
                    _bloc?.add(AdminChangeDrawerPage(pageIndex: 2));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/img/ICONODESCARGO.png',
                    width: 25,
                    height: 25,
                  ),
                  title:
                      Text('Reportes', style: TextStyle(color: Colors.white)),
                  selected: state.pageIndex == 3,
                  onTap: () {
                    _bloc?.add(AdminChangeDrawerPage(pageIndex: 3));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/img/ICONOROLES.png',
                    width: 25,
                    height: 25,
                  ),
                  title: Text('Roles', style: TextStyle(color: Colors.white)),
                  selected: state.pageIndex == 4,
                  onTap: () {
                    _bloc?.add(AdminChangeDrawerPage(pageIndex: 4));
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Image.asset(
                    'assets/img/ICONOROLES.png',
                    width: 25,
                    height: 25,
                  ),
                  title: Text('Zoom', style: TextStyle(color: Colors.blue)),
                  selected: state.pageIndex == 5,
                  onTap: () {
                    _bloc?.add(AdminChangeDrawerPage(pageIndex: 5));
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
                  selected: state.pageIndex == 6,
                  onTap: () {
                    _bloc?.add(AdminChangeDrawerPage(pageIndex: 6));
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Image.asset(
                    'assets/img/CERRARSESION.png',
                    width: 25,
                    height: 25,
                  ),
                  title: Text('Cerrar sesion',
                      style: TextStyle(color: Colors.white)),
                  selected: state.pageIndex == 1,
                  onTap: () async {
                    _bloc?.add(AdminLogout());
                    await Future.delayed(Duration(seconds: 1));
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (route) => false);
                  },
                ),
                Container(
                    width: 200,
                    margin: EdgeInsets.only(top: 50),
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
          );
        }),
        body: BlocBuilder<AdminHomeBloc, AdminHomeState>(
          builder: (context, state) {
            return pageList[state.pageIndex];
          },
        ));
  }

  getAppBarNotSearching(String title, Function startSearchFunction) {
    return AppBar(
      backgroundColor: Color.fromRGBO(2, 10, 158, 1),
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              startSearchFunction();
            }),
      ],
    );
  }

  void startSearching() {
    setState(() {
      _isSearching = true;
    });
  }

  getAppBarSearching(Function cancelSearch, Function searching,
      TextEditingController searchController) {
    return AppBar(
      backgroundColor: Color.fromRGBO(2, 10, 158, 1),
      iconTheme: IconThemeData(color: Colors.white),
      automaticallyImplyLeading: false,
      leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            cancelSearch();
          }),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: TextField(
          controller: searchController,
          onEditingComplete: () {
            searching();
          },
          style: new TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          autofocus: true,
          decoration: InputDecoration(
            focusColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class _searchController {}
