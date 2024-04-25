import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/create/ProfCategoryCreateContent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/create/bloc/ProfCategoryCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/create/bloc/ProfCategoryCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/create/bloc/ProfCategoryCreateState.dart';

class ProfCategoryCreatePage extends StatefulWidget {
  const ProfCategoryCreatePage({super.key});

  @override
  State<ProfCategoryCreatePage> createState() => _ProfCategoryCreatePageState();
}

class _ProfCategoryCreatePageState extends State<ProfCategoryCreatePage> {
  ProfCategoryCreateBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ProfCategoryCreateBloc>(context);
    return Scaffold(
        body: BlocListener<ProfCategoryCreateBloc, ProfCategoryCreateState>(
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
      child: BlocBuilder<ProfCategoryCreateBloc, ProfCategoryCreateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              ProfCategoryCreateContent(_bloc, state),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return ProfCategoryCreateContent(_bloc, state);
      }),
    ));
  }
}
