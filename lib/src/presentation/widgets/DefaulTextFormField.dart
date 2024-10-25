import 'package:flutter/material.dart';

class DefaulTextFormField extends StatelessWidget {
  String label;
  IconData icon;
  String? inicialvalue;
  String? Function(String?)? validator;
  String? errorText;
  Color? color;
  TextInputType? textInputType;
  Function(String text) onChanged;
  bool obscureText;

  DefaulTextFormField(
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
      minLines: 6, // any number you need (It works as the rows for the textarea)
      
      maxLines: null,
      obscureText: obscureText,
      initialValue: inicialvalue,
      onChanged: (text) {
        onChanged(text);
      },
     
      validator: validator,
      decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(color: color),
          ),
          errorText: errorText,
          
          
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color!))),
      style: TextStyle(color: color),
    );
  }
}
