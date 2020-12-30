import 'package:flutter/material.dart';
import 'package:travel_ui/configuration.dart';

class CustomButton extends StatelessWidget {
  Icon icon;
  var onTap;
  CustomButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        child: icon,
        decoration: bc,
      ),
    );
  }
}
