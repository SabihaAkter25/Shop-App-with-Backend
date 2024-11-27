import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/utils/dimantions.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';

import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';

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
            top: Dimantions.popularFoodImgSize,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimantions.width20,
                right: Dimantions.width20,
                top: Dimantions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimantions.radius20),
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side"),
                  SizedBox(height: Dimantions.height10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                              (index) => Icon(
                            Icons.star,
                            color: Colors.teal.shade200,
                          ),
                        ),
                      ),
                      SizedBox(width: Dimantions.width10),
                      SmallText(text: "4.5"),
                      SizedBox(width: Dimantions.width10),
                      SmallText(text: "1287"),
                      SizedBox(width: Dimantions.width10),
                      SmallText(text: "comments"),
                    ],
                  ),
                  SizedBox(height: Dimantions.height10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                        icon: Icons.circle_rounded,
                        text: "Normal",
                        iconColor: Colors.amberAccent,
                      ),
                      IconAndText(
                        icon: Icons.location_on_sharp,
                        text: "1.7Km",
                        iconColor: Colors.cyan,
                      ),
                      IconAndText(
                        icon: Icons.access_time,
                        text: "32 min",
                        iconColor: Colors.redAccent,
                      ),
                    ],
                  ),
                ],
              ),
          ),
          ),
        ],
      ),
    );
  }
}
