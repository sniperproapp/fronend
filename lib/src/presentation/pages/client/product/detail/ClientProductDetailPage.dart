import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/main.dart';
import 'package:sniper_pro/src/blocProvider.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/ClientProductDetailContent.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/bloc/clientproducdetailState.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/bloc/clientproductdetailBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/bloc/clientproductdetailEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProductListEvent.dart';

class ClientProductDetailPage extends StatefulWidget {
  const ClientProductDetailPage({super.key});

  @override
  State<ClientProductDetailPage> createState() =>
      _ClientProductDetailPageState();
}

class _ClientProductDetailPageState extends State<ClientProductDetailPage> {
  Product? product;
  ClientproductdetailBloc? _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(Initdetail(product: product));
    });
  }

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)?.settings.arguments as Product;
    _bloc = BlocProvider.of<ClientproductdetailBloc>(context);
    return Scaffold(
        body: BlocListener<ClientproductdetailBloc, ClientproducdetailState>(
      listener: (context, state) async {
        final responseState = state.response;
        if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          if (responseState.message == "usuario desactivado") {
            context.read<ClientHomeBloc>().add(logout());

            await Future.delayed(Duration(seconds: 2));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
                (route) => false);
          }
        }
        if (responseState is Success) {
          _bloc?.add(Changelike(
              like: responseState.data,
              bandera: int.parse(state.banderalike.toString())));
          //Fluttertoast.showToast(msg: 'LIKE', toastLength: Toast.LENGTH_LONG);
          context.read<ClientProducListBloc>().add(GetProductByCategory(
              idcategory: product!.idCategory,
              estado: product?.estad ?? 'ACTIVO'));
        }
      },
      child: BlocBuilder<ClientproductdetailBloc, ClientproducdetailState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (responseState is Success) {
          if (responseState.data is String) {
          } else {
            return RefreshIndicator(
                onRefresh: () async {
                  _bloc?.add(Changeproduct(
                      id: product!.id!, like: product!.like.toString()));
                },
                child: ClientProductDetailContent(
                    _bloc, responseState.data, state));
          }
        }
        return RefreshIndicator(
            onRefresh: () async {
              _bloc?.add(Changeproduct(
                  id: product!.id!, like: product!.like.toString()));
            },
            child: ClientProductDetailContent(_bloc, product, state));
      }),
    ));
  }
}
