import 'package:flutter/material.dart';
import 'package:travel_ui/screens/home_screen.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Circular',
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    ),
  );
}
