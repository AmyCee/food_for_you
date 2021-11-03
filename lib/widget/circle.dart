import 'package:flutter/material.dart';
import 'package:food_for_you/utils/hex_color.dart';

class CustomCircle extends StatefulWidget {
  Color circleColor = Colors.white;
  CustomCircle({Key? key, this.circleColor = Colors.white}) : super(key: key);

  @override
  State<CustomCircle> createState() => _CustomCircleState();
}

class _CustomCircleState extends State<CustomCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      //margin: EdgeInsets.all(100.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.circleColor
      ),
    );
  }
}
