import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/AdminCategoriListItem.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListState.dart';

class AdminCategoryListPage extends StatefulWidget {
  const AdminCategoryListPage({super.key});

  @override
  State<AdminCategoryListPage> createState() => _AdminCategoryListPageState();
}

class _AdminCategoryListPageState extends State<AdminCategoryListPage> {
  AdminCategoryListBloc? _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(Getcategories());
    });
  }

  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminCategoryListBloc>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'admin/category/create');
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocListener<AdminCategoryListBloc, AdminCategoryListState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              if (responseState.data is bool) {
                _bloc?.add(Getcategories());
              }
            } else if (responseState is Error) {
              Fluttertoast.showToast(
                  msg: responseState.message, toastLength: Toast.LENGTH_LONG);
            }
          },
          child: BlocBuilder<AdminCategoryListBloc, AdminCategoryListState>(
              builder: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              List<Category> category = responseState.data as List<Category>;
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/fondodrawel.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView.builder(
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return AdminCategoriListItem(_bloc, category[index]);
                  },
                ),
              );
            }
            return Container();
          }),
        ));
  }
}
