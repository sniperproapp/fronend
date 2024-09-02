import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/User.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/bloc/AdminUserListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/bloc/AdminUserListEvent.dart';

class AdminUserListItem extends StatelessWidget {
  User? user;
  AdminUserListBloc? bloc;
  AdminUserListItem(this.bloc, this.user);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// Navigator.pushNamed(context, 'admin/product/list', arguments: category);
      },
      child: ListTile(
        leading: user != null
            ? Container(
                width: 70,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/user.png',
                  image: user!.imagen!,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                ),
              )
            : Container(),
        title: Text(user?.email ?? ''),
        subtitle: Row(
          children: [
            Spacer(),
            Text(
              user?.estado == 1 ? 'Activo' : 'Inactivo',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: user?.estado == 1 ? Colors.green : Colors.red),
            ),
          ],
        ),
        contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
        trailing: Wrap(direction: Axis.horizontal, children: [
          IconButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.parse(user!.timeLimit.toString()),
                        firstDate: DateTime(DateTime.now().year),
                        lastDate: DateTime(DateTime.now().year + 1))
                    .then((value) {
                  if (value?.day != null) {
                    if (user!.timeLimit.toString().split('T')[0] !=
                        value.toString().split(' ')[0]) {
                      bloc?.add(activateuser(
                          id: user!.id!, timeLimit: value.toString()));
                    }
                  }
                });
              },
              icon: Icon(Icons.calendar_month)),
          IconButton(
              onPressed: () {
                bloc?.add(Inactivateuser(id: user!.id!));
              },
              icon: Icon(Icons.delete_outline)),
        ]),
      ),
    );
  }
}
