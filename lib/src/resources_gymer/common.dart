import 'package:flutter/material.dart';

Padding customPadding(
  TextEditingController inputVal, //Input text value
  String hintText, //Hint text string
  Icon icon,
  String? Function(String?) validtion, {
  bool isSecured = false,
  TextInputType textInputType = TextInputType.text,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
    child: TextFormField(
      controller: inputVal,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: SizedBox(
          width: 50,
          child: icon,
        ),
      ),
      validator: validtion,
      obscureText: isSecured,
      keyboardType: textInputType,
    ),
  );
}
