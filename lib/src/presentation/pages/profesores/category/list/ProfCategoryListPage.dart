import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/list/ProfCategoriListItem.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/list/bloc/ProfCategoryListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/list/bloc/ProfCategoryListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/list/bloc/ProfCategoryListState.dart';

class ProfCategoryListPage extends StatefulWidget {
  const ProfCategoryListPage({super.key});

  @override
  State<ProfCategoryListPage> createState() => _ProfCategoryListPageState();
}

class _ProfCategoryListPageState extends State<ProfCategoryListPage> {
  ProfCategoryListBloc? _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(Getcategories());
    });
  }

  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ProfCategoryListBloc>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'Prof/category/create');
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocListener<ProfCategoryListBloc, ProfCategoryListState>(
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
          child: BlocBuilder<ProfCategoryListBloc, ProfCategoryListState>(
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
                    return ProfCategoriListItem(_bloc, category[index]);
                  },
                ),
              );
            }
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/fondodrawel.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ));
  }
}
