import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';
import '../../utils/dimentions.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left:Dimentions.width20,
              right: Dimentions.width20,
              top: Dimentions.height20*3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.arrow_back_ios,
                backgroundColor: Colors.tealAccent.shade700,
                iconColor: Colors.white,
                size: Dimentions.iconSize24,),
              SizedBox(width: Dimentions.width20*5,),

              AppIcon(icon: Icons.home_outlined,
                backgroundColor: Colors.tealAccent.shade700,
                iconColor: Colors.white,
                size: Dimentions.iconSize24,),

              AppIcon(icon: Icons.shopping_cart_outlined,
                backgroundColor: Colors.tealAccent.shade700,
                iconColor: Colors.white,
                size: Dimentions.iconSize24,),

            ],
          ))
        ],
      ),
    );
  }
}
