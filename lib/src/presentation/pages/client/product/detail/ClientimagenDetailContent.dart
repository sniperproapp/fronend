import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';

// ignore: must_be_immutable
class ClientimagenDetailContent extends StatelessWidget {
  final String imageURL;

  ClientimagenDetailContent(this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/fondodrawel.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: _actionShopinbag(),
        ),
        DefaultIconBack(
          left: 15,
          top: 35,
          color: Colors.white,
        )
      ],
    );
  }

  Widget _actionShopinbag() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: InteractiveViewer(
        child: Hero(
          tag: 'my_image',
          child: Image.network(
            imageURL,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
