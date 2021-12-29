import 'package:flutter/material.dart';

ButtonStyle redButtonStyle() {
  return ElevatedButton.styleFrom(
    minimumSize: const Size(50, 50),
    textStyle: const TextStyle(
      fontSize: 24,
    ),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
