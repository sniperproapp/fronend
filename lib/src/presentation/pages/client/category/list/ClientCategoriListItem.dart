import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/pages/client/category/list/bloc/ClientCategoryListBloc.dart';

class ClientCategoriListItem extends StatelessWidget {
  Category? category;
  ClientCategoryListBloc? bloc;
  ClientCategoriListItem(this.bloc, this.category);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(children: [
        category != null
            ? Container(
                child: category!.image!.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/img/no-image.png',
                        image: category!.image!,
                        fit: BoxFit.contain,
                      )
                    : Container())
            : Container(),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _botonPendientes(context),
              _botonActivas(context),
              _botonCerradas(context),
            ],
          ),
        )
      ]),
    );
  }

  Widget _botonActivas(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'client/product/list',
            arguments: {'estado': "ACTIVO", 'category': category});
      },
      child: Text(category!.notification.toString(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  Widget _botonPendientes(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'client/product/list',
              arguments: {'estado': "PENDIENTE", 'category': category});
        },
        child: Text('PENDIENTE',
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
  }

  Widget _botonCerradas(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'client/product/list',
              arguments: {'estado': "CERRADA", 'category': category});
        },
        child: Text('CERRADAS',
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
  }
}
