import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:sniper_pro/src/domain/models/User.dart';
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

    return Scaffold(
        body: BlocListener<AdminUserListBloc, AdminUserListState>(
      listener: (context, state) {
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
        if (responseState is Success) {
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
