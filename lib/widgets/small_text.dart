import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height =1.2;


  SmallText({super.key,  this.color=Colors.black26, required this.text,
this.height=1.2,
    this.size=16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
        height: height
      ),

    );
  }
}
