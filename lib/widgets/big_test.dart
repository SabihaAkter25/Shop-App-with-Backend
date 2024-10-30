import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

   BigText({super.key,  this.color=Colors.tealAccent, required this.text,
   this.overflow=TextOverflow.ellipsis,
     this.size=20
   });

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
    overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
      ),

    );
  }
}
