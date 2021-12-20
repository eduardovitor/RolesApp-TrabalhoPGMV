import 'package:flutter/material.dart';

class MyFormInput extends StatelessWidget {
  // Declare your custom vars, including your validator function
  final String? changedValue;
  final String? label;
  final String? hint;
  final bool? isTextObscured;
  final String? Function(String?)? validator;

  const MyFormInput(
      {Key? key,
      this.changedValue,
      this.label,
      this.isTextObscured,
      this.validator,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFF61b98e)))),
      validator: validator,
      cursorColor: const Color(0xFF61b98e),
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