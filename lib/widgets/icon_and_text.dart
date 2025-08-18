import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;
  final double size;

  const IconTextWidget({super.key,
    required this.icon,
    required this.text,

    required this.iconColor, this.size=20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Icon(icon, color: iconColor,size: size,),
        SizedBox(width:4,),
        Smalltext(color: Colors.black45, text: text),

      ],
    );
  }
}
