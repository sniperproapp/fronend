import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/AdminProducListItem.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/bloc/AdminProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/bloc/AdminProductListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/bloc/AdminProductListState.dart';

class AdminProducListPage extends StatefulWidget {
  const AdminProducListPage({super.key});

  @override
  State<AdminProducListPage> createState() => _AdminProducListPageState();
}

class _AdminProducListPageState extends State<AdminProducListPage> {
  AdminProducListBloc? _bloc;
  Category? category;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (category != null) {
        _bloc?.add(GetProductByCategory(idcategory: category!.id!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)?.settings.arguments as Category;
    _bloc = BlocProvider.of<AdminProducListBloc>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'admin/product/create',
                arguments: category);
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocListener<AdminProducListBloc, AdminProductListState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              if (responseState.data is bool) {
                _bloc?.add(GetProductByCategory(idcategory: category!.id!));
              }
            } else if (responseState is Error) {
              Fluttertoast.showToast(
                  msg: responseState.message, toastLength: Toast.LENGTH_LONG);
            }
          },
          child: BlocBuilder<AdminProducListBloc, AdminProductListState>(
              builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (responseState is Success) {
              List<Product> product = responseState.data as List<Product>;
              return ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  return AdminProductListItem(_bloc, product[index]);
                },
              );
            }
            return Container();
          }),
        ));
  }
}
