import 'package:flutter/material.dart';

SelectOptionImageDialog(
    BuildContext context, Function() pickImage, Function() takephoto) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text('seleccione una opcion'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text(
                    'galeria',
                    style: TextStyle(color: Colors.black),
                  )),
              ElevatedButton(
                  onPressed: () {
                    takephoto();
                  },
                  child: Text(
                    'camara',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ));
}
