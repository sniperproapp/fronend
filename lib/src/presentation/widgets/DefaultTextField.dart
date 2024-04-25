import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  String label;
  IconData icon;
  String? inicialvalue;
  String? Function(String?)? validator;
  String? errorText;
  Color? color;
  TextInputType? textInputType;
  Function(String text) onChanged;
  bool obscureText;

  DefaultTextField(
      {Key? key,
      required this.label,
      this.inicialvalue,
      required this.icon,
      this.validator,
      this.color = Colors.white,
      textInputType = TextInputType.text,
      required this.onChanged,
      this.obscureText = false,
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      initialValue: inicialvalue,
      onChanged: (text) {
        onChanged(text);
      },
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(color: color),
          ),
          errorText: errorText,
          prefixIcon: Icon(
            icon,
            color: color,
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color!)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color!))),
      style: TextStyle(color: color),
    );
  }
}
