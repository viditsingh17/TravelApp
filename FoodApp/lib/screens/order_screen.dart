import 'package:FoodApp/configuration.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 1.3,
            child: Container(
              // width: size.width * 2,
              height: size.width,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
                boxShadow: customShadow,
              ),
            ),
          ),
          Column(),
        ],
      ),
    );
  }
}
