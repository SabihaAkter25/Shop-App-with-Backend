import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/utils/dimantions.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';
import '../../widgets/app_column.dart';
import '../../widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background image
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
          //icon widget
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
          //introduction of food
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
                  const AppColumn(text: "Chinese Side",),
                  SizedBox(height: Dimantions.height20,),
                  BigText(text: "Introduced"),
                  SizedBox(height: Dimantions.height20,),
                  const ExpandableTextWidget(text: 'Food groups categorise foods for educational purposes, usually grouping together foods with similar nutritional properties or biological classifications. Food groups are often used in nutrition guides, although the number of groups used can vary widely.[1] ',)
                ],
              )
          ),
          ),


        ],
      ),
      bottomNavigationBar: Container(
        height: Dimantions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimantions.height20,
            bottom: Dimantions.height20,
            left: Dimantions.width10,
            right: Dimantions.width10,
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimantions.radius15*2),
            topRight: Radius.circular(Dimantions.radius15*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Container(
padding: EdgeInsets.only(
    top: Dimantions.height10,
    bottom:Dimantions.height10,
    right: Dimantions.width10,
    left: Dimantions.width10 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimantions.radius15),
                color: Colors.white
              ),
              child: Row(
                children: [
                  const Icon(Icons.remove,color: Colors.black45,),
                 SizedBox(width: Dimantions.width10,),
                  BigText(text: '0'),
                  SizedBox(width: Dimantions.width10,),
                  const Icon(Icons.add,color: Colors.black45,),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimantions.height10,
                  bottom:Dimantions.height10,
                  right: Dimantions.width10,
                  left: Dimantions.width10 ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimantions.radius15),
                  color: Colors.tealAccent.shade700,
              ),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white,),

            ),
          ],
        ),
      ),
    );
  }
}
