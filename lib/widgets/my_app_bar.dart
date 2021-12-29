import 'package:flutter/material.dart';

/* OJO el AppBar no es un widget */

AppBar myAppBar(String auxText) {
  return AppBar(
    title: Text(
      auxText,
      style: const TextStyle(fontSize: 24),
    ),
    centerTitle: true,
    elevation: 0,
  );
}
