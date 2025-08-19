import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/cart_controller.dart';
import '../../controller/popular_product_controller.dart';
import '../../utils/app_constants.dart';
import '../../utils/dimentions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';
import '../cart/cart_page.dart';
import '../home/food_page_body.dart';
import '../home/main_food_page.dart';

class  PopolarFoodDetail extends StatelessWidget {
  int pageId;
  PopolarFoodDetail( {super.key, required  this.pageId, });

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());

    return Scaffold(

      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
          height: 120,
          padding: EdgeInsets.only(
            top: Dimentions.height30,
            bottom: Dimentions.height30,
            left: Dimentions.width30,
            right: Dimentions.width20,
          ),
          decoration:BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                topRight:Radius.circular(Dimentions.radius20*2),
                topLeft:Radius.circular(Dimentions.radius20*2),

              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Container(
                padding: EdgeInsets.only(top: Dimentions.height10,bottom: Dimentions.height10,right: Dimentions.width20,left: Dimentions.width20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove,color: Colors.black,)),
                    SizedBox(width: Dimentions.width10,),
                    Bigtext(text: popularProduct.inCartItems.toString()),
                    SizedBox(width: Dimentions.width10,),
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add,color: Colors.black,)),                  ],
                ),
              ),

              GestureDetector(
                onTap:(){
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimentions.height20,bottom: Dimentions.height20,right: Dimentions.width20,left: Dimentions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius20),
                      color: Colors.tealAccent.shade700
                  ),

                  child: Bigtext(text: "\$ ${product.price!} | Add to Cart",
                      color:Colors.white),
                ),
              )


            ],
          ),

        );
      }),

      body:Stack(
        children: [
          //image
          Positioned(
              left: 0,
              right:0,
              child: Container(
                  width: double.maxFinite,
                  height: Dimentions.popularFoodImgSide,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image:NetworkImage(
                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                        ),
                        fit: BoxFit.cover,
                      )
                  )


              )
          ),
          //icon
          Positioned(
              top:Dimentions.height45,
              left: Dimentions.width30,
              right: Dimentions.width30,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.to(()=>MainFoodPage());
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios, )),

                  GetBuilder<PopularProductController>(builder:(controller){
                    return Stack(
                      children: [
                        GestureDetector(
                            onTap:(){
                              Get.to(()=>CartPage());
                    },
                            child: AppIcon(icon: Icons.shopping_cart_outlined,)),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                          top:0, right:0,
                          child: AppIcon(icon: Icons.circle,size: 20,backgroundColor: Colors.tealAccent.shade700,
                            iconColor: Colors.transparent,),
                        ):Container(),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                            top:2, right:7,
                            child: Bigtext(text:  Get.find<PopularProductController>().totalItems.toString(),
                              size: 14, color: Colors.white,
                            ))
                            :Container(),


                      ],
                    );

                  })

                ],
              )

          ),
          //intro of food
          Positioned(
            left:0,
            right:0,
            bottom:0,
            top:Dimentions.popularFoodImgSide-20,
            child: Container(
                padding: EdgeInsets.only(
                    top: Dimentions.height30,
                    left: Dimentions.width30,
                    right: Dimentions.width30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(

                      topRight: Radius.circular(Dimentions.radius20),
                      topLeft: Radius.circular(Dimentions.radius20)
                  ),
                  color:Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text:product.name!),
                      SizedBox(height: Dimentions.height20,),
                      Bigtext(text: "Introduce"),
                      SizedBox(height: Dimentions.height20,),

                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(
                              text: product.description!
                          ),
                        ),
                      )

                    ])

            ),
          ),
          //expandable text widget

        ],
      ),
    );
  }
}
