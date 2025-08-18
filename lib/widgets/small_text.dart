import 'package:flutter/cupertino.dart';

class Smalltext extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;


  Smalltext({super.key,
    this.color,
    required this.text,
    this.size=13,
    this.height=1.6
  });

  @override
  Widget build(
      BuildContext context) {
    return Text(
      text,

      style: TextStyle(color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
        height:height,
      ),

    );
  }
}
