import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/create/AdminProductCreateContent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/create/bloc/AdminProductCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/create/bloc/AdminProductCreateState.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/bloc/AdminProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/bloc/AdminProductListEvent.dart';

class AdminProductCreatePage extends StatefulWidget {
  const AdminProductCreatePage({super.key});

  @override
  State<AdminProductCreatePage> createState() => _AdminProductCreatePageState();
}

class _AdminProductCreatePageState extends State<AdminProductCreatePage> {
  AdminProductCreateBloc? _bloc;
  Category? category;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(AdminProductInitEvent(category: category));
    });
  }

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)?.settings.arguments as Category;

    _bloc = BlocProvider.of<AdminProductCreateBloc>(context);
    return Scaffold(
        body: BlocListener<AdminProductCreateBloc, AdminProductCreateState>(
      listener: (context, state) {
        final responsestate = state.response;

        if (responsestate is Success) {
          context
              .read<AdminProducListBloc>()
              .add(GetProductByCategory(idcategory: category!.id!));
          //    context.read<AdminProductListBloc>().add(Getcategories());

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
      child: BlocBuilder<AdminProductCreateBloc, AdminProductCreateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              AdminProductCreateContent(_bloc, state),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return AdminProductCreateContent(_bloc, state);
      }),
    ));
  }
}
