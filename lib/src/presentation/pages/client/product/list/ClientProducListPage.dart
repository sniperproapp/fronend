import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/main.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/ClientProducListItem.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProductListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProductListState.dart';

class ClientProducListPage extends StatefulWidget {
  const ClientProducListPage({super.key});

  @override
  State<ClientProducListPage> createState() => _ClientProducListPageState();
}

class _ClientProducListPageState extends State<ClientProducListPage> {
  ClientProducListBloc? _bloc;
  Category? category;
  String? estado;
  late List<Product> products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (category != null) {
        _bloc?.add(
            GetProductByCategory(idcategory: category!.id!, estado: estado!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    category = data['category'];
    estado = data['estado'];

    _bloc = BlocProvider.of<ClientProducListBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(2, 10, 158, 1),
          title: Text(
            'Señales: ${category!.name}',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: BlocListener<ClientProducListBloc, ClientProductListState>(
          listener: (context, state) async {
            final responseState = state.response;
            if (responseState is Success) {
              if (responseState.data is bool) {
                products[state.index!].like =
                    (products[state.index!].like! + 1);
                // _bloc?.add(GetProductByCategory(
                //     idcategory: category!.id!, estado: estado!));
              }
            } else if (responseState is Error) {
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
          },
          child: BlocBuilder<ClientProducListBloc, ClientProductListState>(
              builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (responseState is Success) {
              if (responseState.data is bool) {
              } else {
                List<Product> product = responseState.data as List<Product>;
                products = responseState.data as List<Product>;
              }

              return RefreshIndicator(
                  onRefresh: () async {
                    _bloc?.add(GetProductByCategory(
                        idcategory: category!.id!, estado: estado!));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/img/fondodrawel.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: PopScope(
                      canPop: false,
                      onPopInvoked: (didPop) async {
                        if (didPop) {
                          return;
                        }
                        _bloc?.add(GetProductByCategory(
                            idcategory: category!.id!, estado: estado!));
                        final navigator = Navigator.of(context);

                        navigator.pop();
                      },
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return ClientProductListItem(
                              _bloc, products[index], state, index);
                        },
                      ),
                    ),
                  ));
            }
            return Container();
          }),
        ));
  }
}
