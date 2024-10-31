import 'package:flutter/cupertino.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({super.key, required this.icon, required this.text, required this.iconColor});

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,  // Apply the iconColor here
        ),
        SizedBox(width: 5),
        SmallText(text: text),
      ],
    );
  }
}
