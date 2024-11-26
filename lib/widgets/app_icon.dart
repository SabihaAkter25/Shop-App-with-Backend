import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconcolor;
  final double size;
  const AppIcon({super.key,
    required this.icon,
    this.backgroundColor=const Color(0xFFfcf4e4),
    this.iconcolor= const Color(0xFF756d54),
    this.size=40
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
