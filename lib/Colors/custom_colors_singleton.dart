import 'package:flutter/material.dart';

class CustomColorsSing {
  static final CustomColorsSing _CustomColorsSing =
      CustomColorsSing._internal();

  factory CustomColorsSing() {
    return _CustomColorsSing;
  }

  CustomColorsSing._internal();

  final purple = Color(0xFF664E88);
  final gray = Color(0xFFF5F5F5);
  final DimGray = Color(0xFF696969);
  final black = Color(0xFF121212);
}
