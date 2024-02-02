import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String hint;
  final String label;
  final bool? obscureText;
  Function(String)? onchanged;
  final TextInputType? textInputType;
  CustomText(
      {Key? key,
      @required this.onchanged,
      required this.hint,
      required this.label,
      @required this.obscureText,
      @required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: textInputType,
        onFieldSubmitted: onchanged,
        obscureText: ((obscureText != null) ? obscureText : false)!,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          //labelStyle: TextStyle(color: Colors.white),
          //hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
