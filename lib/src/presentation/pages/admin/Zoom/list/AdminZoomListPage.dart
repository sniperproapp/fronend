import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sniper_pro/src/domain/models/Zoom.dart';

import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/AdminZoomListItem.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/bloc/AdminZoomListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/bloc/AdminZoomListEvent.dart';

import 'package:sniper_pro/src/presentation/pages/admin/Zoom/list/bloc/AdminZoomListState.dart';

class AdminZoomListPage extends StatefulWidget {
  const AdminZoomListPage({super.key});

  @override
  State<AdminZoomListPage> createState() => _AdminZoomListPageState();
}

class _AdminZoomListPageState extends State<AdminZoomListPage> {
  AdminZoomListBloc? _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(Getzoom());
    });
  }

  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminZoomListBloc>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'admin/Zoom/create');
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocListener<AdminZoomListBloc, AdminZoomListState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              if (responseState.data is bool) {
                _bloc?.add(Getzoom());
              }
            } else if (responseState is Error) {
              Fluttertoast.showToast(
                  msg: responseState.message, toastLength: Toast.LENGTH_LONG);
            }
          },
          child: BlocBuilder<AdminZoomListBloc, AdminZoomListState>(
              builder: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              List<Zoom> zoom = responseState.data as List<Zoom>;
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/fondodrawel.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView.builder(
                  itemCount: zoom.length,
                  itemBuilder: (context, index) {
                    return AdminZoomListItem(_bloc, zoom[index]);
                  },
                ),
              );
            }
            return Container();
          }),
        ));
  }
}
