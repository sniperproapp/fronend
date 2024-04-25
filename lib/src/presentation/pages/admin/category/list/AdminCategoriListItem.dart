import 'package:flutter/material.dart';
import 'package:sniper_pro/src/domain/models/Category.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';

class AdminCategoriListItem extends StatelessWidget {
  Category? category;
  AdminCategoryListBloc? bloc;
  AdminCategoriListItem(this.bloc, this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'admin/product/list', arguments: category);
      },
      child: ListTile(
        leading: category != null
            ? Container(
                width: 100,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/user.png',
                  image: category!.image!,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                ),
              )
            : Container(),
        title: Text(category?.name ?? ''),
        textColor: Colors.white,
        subtitle: Text(category?.description ?? ''),
        contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
        trailing: Wrap(direction: Axis.horizontal, children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'admin/category/update',
                  arguments: category);
            },
            icon: Icon(Icons.edit),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              bloc?.add(DeleteCategory(id: category!.id!));
            },
            icon: Icon(Icons.delete),
            color: Colors.white,
          ),
        ]),
      ),
    );
  }
}
