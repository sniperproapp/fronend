import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/update/AdminCategoryUpdateContent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateState.dart';

class AdminCategoryUpdatePage extends StatefulWidget {
  const AdminCategoryUpdatePage({super.key});

  @override
  State<AdminCategoryUpdatePage> createState() =>
      _AdminCategoryUpdatePageState();
}

class _AdminCategoryUpdatePageState extends State<AdminCategoryUpdatePage> {
  Category? category;

  AdminCategoryUpdateBloc? _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(AdminCategoriInitEvent(category: category));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _bloc?.add(ResetForm());
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminCategoryUpdateBloc>(context);
    category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
        body: BlocListener<AdminCategoryUpdateBloc, AdminCategoryUpdateState>(
      listener: (context, state) {
        final responsestate = state.response;
        if (responsestate is Success) {
          context.read<AdminCategoryListBloc>().add(Getcategories());

          Fluttertoast.showToast(
              msg: 'la categoria se modifico correctamente',
              toastLength: Toast.LENGTH_LONG);
        } else if (responsestate is Error) {
          Fluttertoast.showToast(
              msg: responsestate.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<AdminCategoryUpdateBloc, AdminCategoryUpdateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              AdminCategoryUpdateContent(_bloc, state, category),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return AdminCategoryUpdateContent(_bloc, state, category);
      }),
    ));
  }
}
