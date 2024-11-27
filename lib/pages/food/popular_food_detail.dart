import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/utils/dimantions.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';
import '../../widgets/app_column.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
              right: 0,
              child:Container(
                width:double.maxFinite,
                height: Dimantions.popularFoodImgSize,
decoration: const BoxDecoration(
  image: DecorationImage(
    fit: BoxFit.cover,
      image:AssetImage("assets/images/food2.jpg"),
  )
),
              ) ),
          Positioned(
            top: Dimantions.height45,
              left: Dimantions.width20,
              right: Dimantions.width20,
              child:const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.arrow_back_ios),
              AppIcon(icon: Icons.shopping_cart_outlined),

            ],
          ) ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimantions.popularFoodImgSize-20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimantions.width20,
                right: Dimantions.width20,
                top: Dimantions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(Dimantions.radius20),
                  topLeft:Radius.circular(Dimantions.radius20),
                ),
                color: Colors.white,
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Chinese Side",),
                  SizedBox(height: Dimantions.height20,),
                  BigText(text: "Introduced"),
                ],
              )
          ),
          ),
        ],
      ),
    );
  }
}
