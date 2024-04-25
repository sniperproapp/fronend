import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/bloc/AdminProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/bloc/AdminProductListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/update/AdminProductUpdateContent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateState.dart';

class AdminProductUpdatePage extends StatefulWidget {
  const AdminProductUpdatePage({super.key});

  @override
  State<AdminProductUpdatePage> createState() => _AdminProductUpdatePageState();
}

class _AdminProductUpdatePageState extends State<AdminProductUpdatePage> {
  AdminProductUpdateBloc? _bloc;
  Product? product;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(AdminProductUpdateInitEvent(product: product));
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

    _bloc = BlocProvider.of<AdminProductUpdateBloc>(context);
    return Scaffold(
        body: BlocListener<AdminProductUpdateBloc, AdminProductUpdateState>(
      listener: (context, state) {
        final responsestate = state.response;
        if (responsestate is Success) {
          context
              .read<AdminProducListBloc>()
              .add(GetProductByCategory(idcategory: product!.idCategory));

          Fluttertoast.showToast(
              msg: 'Producto actualizado ', toastLength: Toast.LENGTH_LONG);
        } else if (responsestate is Error) {
          Fluttertoast.showToast(
              msg: responsestate.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<AdminProductUpdateBloc, AdminProductUpdateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              AdminProductUpdateContent(_bloc, state, product),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return AdminProductUpdateContent(_bloc, state, product);
      }),
    ));
  }
}
