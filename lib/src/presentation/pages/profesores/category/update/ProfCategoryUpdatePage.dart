import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/list/bloc/ProfCategoryListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/list/bloc/ProfCategoryListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/update/ProfCategoryUpdateContent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/update/bloc/ProfCategoryUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/update/bloc/ProfCategoryUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/update/bloc/ProfCategoryUpdateState.dart';

class ProfCategoryUpdatePage extends StatefulWidget {
  const ProfCategoryUpdatePage({super.key});

  @override
  State<ProfCategoryUpdatePage> createState() => _ProfCategoryUpdatePageState();
}

class _ProfCategoryUpdatePageState extends State<ProfCategoryUpdatePage> {
  Category? category;

  ProfCategoryUpdateBloc? _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(ProfCategoriInitEvent(category: category));
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
    _bloc = BlocProvider.of<ProfCategoryUpdateBloc>(context);
    category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
        body: BlocListener<ProfCategoryUpdateBloc, ProfCategoryUpdateState>(
      listener: (context, state) {
        final responsestate = state.response;
        if (responsestate is Success) {
          context.read<ProfCategoryListBloc>().add(Getcategories());

          Fluttertoast.showToast(
              msg: 'la categoria se modifico correctamente',
              toastLength: Toast.LENGTH_LONG);
        } else if (responsestate is Error) {
          Fluttertoast.showToast(
              msg: responsestate.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<ProfCategoryUpdateBloc, ProfCategoryUpdateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              ProfCategoryUpdateContent(_bloc, state, category),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return ProfCategoryUpdateContent(_bloc, state, category);
      }),
    ));
  }
}
