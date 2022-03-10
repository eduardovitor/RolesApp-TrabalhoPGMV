import 'package:flutter/material.dart';

import '../Colors/custom_colors_singleton.dart';

class MyFormInput extends StatelessWidget {
  // Declare your custom vars, including your validator function
  final String? changedValue;
  final String? label;
  final String? hint;
  final bool isTextObscured;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const MyFormInput(
      {Key? key,
      this.changedValue,
      this.label,
      this.isTextObscured = false,
      this.validator,
      this.hint,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isTextObscured,
      validator: validator,
      cursorColor: CustomColorsSing().purple,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: CustomColorsSing().purple))),
    );
  }
}

String? checkFieldEmpty(String? fieldContent) {
  //<-- add String? as a return type
  if (fieldContent == null || fieldContent.isEmpty) {
    return 'Por favor digite algo';
  }
  return null;
}
