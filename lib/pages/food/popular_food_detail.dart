import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_app_with_backend/controller/popular_product_controller.dart';
import 'package:shop_app_with_backend/utils/app_constants.dart';
import 'package:shop_app_with_backend/utils/dimantions.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';
import '../../widgets/app_column.dart';
import '../../widgets/expandable_text_widget.dart';
import '../home/main_food_page.dart';

class PopularFoodDetail extends StatelessWidget {
  final pageId;
   const PopularFoodDetail({required this.pageId,super.key});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
  Get.find<PopularProductController>().initProduct();
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
decoration:  BoxDecoration(
  image: DecorationImage(
    fit: BoxFit.cover,
      image:NetworkImage(AppConstant.BASE_URL+AppConstant.UPLOAD_URL+product.img!),
  )
),
              ) ),
          //icon widget
          Positioned(
            top: Dimantions.height45,
              left: Dimantions.width20,
              right: Dimantions.width20,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:(){
                  Get.to(()=>MainFoodPage());
          },
                  child: AppIcon(icon: Icons.arrow_back_ios, color: Colors.black,)),
              const AppIcon(icon: Icons.shopping_cart_outlined,color: Colors.black,),

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
                  AppColumn(text:product.name!,),
                  SizedBox(height: Dimantions.height20,),
                  BigText(text: "Introduced"),
                  SizedBox(height: Dimantions.height20,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(text: product.description! ,),
                    ),
                  )
                ],
              )
          ),
          ),


        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (PopularProduct){
        return Container(
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
                    GestureDetector(
                        onTap:(){
                          PopularProduct.setQuantity(false);

                 },
                        child: const Icon(Icons.remove,color: Colors.black45,)),
                    SizedBox(width: Dimantions.width10,),
                    BigText(text: PopularProduct.quantity.toString()),
                    SizedBox(width: Dimantions.width10,),
                    GestureDetector(
                        onTap: (){
                            PopularProduct.setQuantity(true);
                        },
                        child: const Icon(Icons.add,color: Colors.black45,)),

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
                child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white,),

              ),
            ],
          ),
        );
      })
    );
  }
}
