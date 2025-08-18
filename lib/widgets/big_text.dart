import 'package:flutter/cupertino.dart';

import '../utils/dimentions.dart';

class Bigtext extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  Bigtext( {super.key,
    this.color,
    required this.text,
    this.overflow=TextOverflow.ellipsis,
    this.size=0
  });

  @override
  Widget build(
      BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(color: color,fontSize:size==0? Dimentions.font20:size,fontWeight: FontWeight.w400),

    );
  }
}

