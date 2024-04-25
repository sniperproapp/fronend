import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProductListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/update/ProfProductUpdateContent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/update/bloc/ProfProductUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/update/bloc/ProfProductUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/update/bloc/ProfProductUpdateState.dart';

class ProfProductUpdatePage extends StatefulWidget {
  const ProfProductUpdatePage({super.key});

  @override
  State<ProfProductUpdatePage> createState() => _ProfProductUpdatePageState();
}

class _ProfProductUpdatePageState extends State<ProfProductUpdatePage> {
  ProfProductUpdateBloc? _bloc;
  Product? product;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(ProfProductUpdateInitEvent(product: product));
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
    product = ModalRoute.of(context)?.settings.arguments as Product;

    _bloc = BlocProvider.of<ProfProductUpdateBloc>(context);
    return Scaffold(
        body: BlocListener<ProfProductUpdateBloc, ProfProductUpdateState>(
      listener: (context, state) {
        final responsestate = state.response;
        if (responsestate is Success) {
          context
              .read<ProfProducListBloc>()
              .add(GetProductByCategory(idcategory: product!.idCategory));

          Fluttertoast.showToast(
              msg: 'Producto actualizado ', toastLength: Toast.LENGTH_LONG);
        } else if (responsestate is Error) {
          Fluttertoast.showToast(
              msg: responsestate.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<ProfProductUpdateBloc, ProfProductUpdateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              ProfProductUpdateContent(_bloc, state, product),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return ProfProductUpdateContent(_bloc, state, product);
      }),
    ));
  }
}
