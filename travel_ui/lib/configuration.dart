import 'package:flutter/material.dart';

BoxDecoration bc = BoxDecoration(
  color: Colors.grey.withOpacity(0.15),
  borderRadius: BorderRadius.circular(10),
);

List<BoxShadow> customShadow = [
  BoxShadow(
    color: Colors.grey[300],
    blurRadius: 30,
    offset: Offset(0, 10),
  ),
];
