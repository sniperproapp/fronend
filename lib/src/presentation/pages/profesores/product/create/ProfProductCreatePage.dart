import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/create/ProfProductCreateContent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/create/bloc/ProfProductCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/create/bloc/ProfProductCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/create/bloc/ProfProductCreateState.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProductListEvent.dart';

class ProfProductCreatePage extends StatefulWidget {
  const ProfProductCreatePage({super.key});

  @override
  State<ProfProductCreatePage> createState() => _ProfProductCreatePageState();
}

class _ProfProductCreatePageState extends State<ProfProductCreatePage> {
  ProfProductCreateBloc? _bloc;
  Category? category;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(ProfProductInitEvent(category: category));
    });
  }

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)?.settings.arguments as Category;

    _bloc = BlocProvider.of<ProfProductCreateBloc>(context);
    return Scaffold(
        body: BlocListener<ProfProductCreateBloc, ProfProductCreateState>(
      listener: (context, state) {
        final responsestate = state.response;

        if (responsestate is Success) {
          context
              .read<ProfProducListBloc>()
              .add(GetProductByCategory(idcategory: category!.id!));
          //    context.read<ProfProductListBloc>().add(Getcategories());

          _bloc?.add(ResetForm());
          Fluttertoast.showToast(
              msg: 'la Señal se creo correctamente',
              toastLength: Toast.LENGTH_LONG);
        }
        if (responsestate is Error) {
          Fluttertoast.showToast(
              msg: responsestate.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<ProfProductCreateBloc, ProfProductCreateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              ProfProductCreateContent(_bloc, state),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return ProfProductCreateContent(_bloc, state);
      }),
    ));
  }
}
