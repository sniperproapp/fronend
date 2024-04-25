import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/ProfProducListItem.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProductListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/bloc/ProfProductListState.dart';

class ProfProducListPage extends StatefulWidget {
  const ProfProducListPage({super.key});

  @override
  State<ProfProducListPage> createState() => _ProfProducListPageState();
}

class _ProfProducListPageState extends State<ProfProducListPage> {
  ProfProducListBloc? _bloc;
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
    _bloc = BlocProvider.of<ProfProducListBloc>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'Prof/product/create',
                arguments: category);
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocListener<ProfProducListBloc, ProfProductListState>(
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
          child: BlocBuilder<ProfProducListBloc, ProfProductListState>(
              builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (responseState is Success) {
              List<Product> product = responseState.data as List<Product>;
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/fondodrawel.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return ProfProducListItem(_bloc, product[index]);
                  },
                ),
              );
            }
            return Container();
          }),
        ));
  }
}
