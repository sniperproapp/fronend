import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/main.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/category/list/ClientCategoriListItem.dart';
import 'package:sniper_pro/src/presentation/pages/client/category/list/bloc/ClientCategoryListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/category/list/bloc/ClientCategoryListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/category/list/bloc/ClientCategoryListState.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';

class ClientCategoryListPage extends StatefulWidget {
  const ClientCategoryListPage({super.key});

  @override
  State<ClientCategoryListPage> createState() => _ClientCategoryListPageState();
}

class _ClientCategoryListPageState extends State<ClientCategoryListPage> {
  ClientCategoryListBloc? _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(Getcategories());
    });
  }

  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientCategoryListBloc>(context);

    return Scaffold(
        body: BlocListener<ClientCategoryListBloc, ClientCategoryListState>(
      listener: (context, state) async {
        final responseState = state.response;

        if (responseState is Success) {
          _bloc?.add(categorySaveUserSession(list: responseState.data));
        } else if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          if (responseState.message == "Unauthorized") {
            Navigator.pushNamed(context, 'login/cerrarsesion');
          }
          if (responseState.message == "usuario desactivado") {
            context.read<ClientHomeBloc>().add(logout());

            await Future.delayed(Duration(seconds: 2));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
                (route) => false);
          }
        }
      },
      child: BlocBuilder<ClientCategoryListBloc, ClientCategoryListState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Success) {
          List<Category> category = responseState.data as List<Category>;

          return RefreshIndicator(
            onRefresh: () async {
              _bloc?.add(Getcategories());
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/fondodrawel.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView.builder(
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return ClientCategoriListItem(_bloc, category[index]);
                },
              ),
            ),
          );
        }
        return Container();
      }),
    ));
  }
}
