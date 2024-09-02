import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/domain/useCases/user/desactivateuserallUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/AdminUserListItem.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/bloc/AdminUserListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/bloc/AdminUserListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/bloc/AdminUserListState.dart';

class AdminUserListPage extends StatefulWidget {
  const AdminUserListPage({super.key});

  @override
  State<AdminUserListPage> createState() => _AdminUserListPageState();
}

class _AdminUserListPageState extends State<AdminUserListPage> {
  AdminUserListBloc? _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(Getuser(busqueda: 'allusers'));
    });
  }

  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminUserListBloc>(context);
    final now = DateTime.now();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('DESACTIVAR A TODOS'),
                    content: Text(
                        'Seran desactivados todos los usuarios con fecha de corte  0' +
                            now.month.toString() +
                            '/05'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          _bloc?.add(deactivatalleuser());
                          Fluttertoast.showToast(
                              msg: 'usuarios desactivados',
                              toastLength: Toast.LENGTH_LONG);
                          Navigator.pop(context, 'SI');
                        },
                        child: const Text('SI'),
                      ),
                    ],
                  )),
          backgroundColor: Colors.black,
          child: Icon(
            Icons.deselect,
            color: Colors.white,
          ),
        ),
        body: BlocListener<AdminUserListBloc, AdminUserListState>(
          listener: (context, state) async {
            final responseState = state.response;
            if (responseState is Success) {
              if (responseState.data is bool) {
                _bloc?.add(Getuser(busqueda: 'allusers'));
              }
            } else if (responseState is Error) {
              Fluttertoast.showToast(
                  msg: responseState.message, toastLength: Toast.LENGTH_LONG);
            }
          },
          child: BlocBuilder<AdminUserListBloc, AdminUserListState>(
              builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (responseState is Success) {
              List<User> user = responseState.data as List<User>;
              return ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return AdminUserListItem(_bloc, user[index]);
                },
              );
            }
            return Container();
          }),
        ));
  }
}
