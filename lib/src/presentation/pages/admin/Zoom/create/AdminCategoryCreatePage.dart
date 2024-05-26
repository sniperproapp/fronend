import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/create/AdminCategoryCreateContent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateState.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';

class AdminCategoryCreatePage extends StatefulWidget {
  const AdminCategoryCreatePage({super.key});

  @override
  State<AdminCategoryCreatePage> createState() =>
      _AdminCategoryCreatePageState();
}

class _AdminCategoryCreatePageState extends State<AdminCategoryCreatePage> {
  AdminCategoryCreateBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminCategoryCreateBloc>(context);
    return Scaffold(
        body: BlocListener<AdminCategoryCreateBloc, AdminCategoryCreateState>(
      listener: (context, state) {
        final responsestate = state.response;
        if (responsestate is Success) {
          context.read<AdminCategoryListBloc>().add(Getcategories());

          _bloc?.add(ResetForm());
          Fluttertoast.showToast(
              msg: 'la categoria se creo correctamente',
              toastLength: Toast.LENGTH_LONG);
        } else if (responsestate is Error) {
          Fluttertoast.showToast(
              msg: responsestate.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<AdminCategoryCreateBloc, AdminCategoryCreateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              AdminCategoryCreateContent(_bloc, state),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return AdminCategoryCreateContent(_bloc, state);
      }),
    ));
  }
}
