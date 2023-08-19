import 'package:flutter/material.dart';

Widget paperSize(
  String size,
) {
  return Expanded(
    child: Text(
      size,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
