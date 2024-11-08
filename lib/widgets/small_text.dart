import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/utils/dimantions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height =1.2;


  SmallText({super.key,  this.color=Colors.black26, required this.text,
this.height=1.2,
    this.size=12,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: Dimantions.font10,
        height: height
      ),

    );
  }
}
