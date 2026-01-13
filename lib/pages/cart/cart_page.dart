import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_with_backend/controller/cart_controller.dart';
import 'package:shop_app_with_backend/controller/popular_product_controller.dart';
import 'package:shop_app_with_backend/model/product_model.dart';
import 'package:shop_app_with_backend/pages/home/main_food_page.dart';
import 'package:shop_app_with_backend/utils/app_constants.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';
import '../../controller/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
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

              GestureDetector(
                onTap:(){
                  Get.toNamed(RouteHelper.getInitial());
                },

                child: AppIcon(icon: Icons.home_outlined,
                  backgroundColor: Colors.tealAccent.shade700,
                  iconColor: Colors.white,
                  size: Dimentions.iconSize24,),
              ),

              AppIcon(icon: Icons.shopping_cart_outlined,
                backgroundColor: Colors.tealAccent.shade700,
                iconColor: Colors.white,
                size: Dimentions.iconSize24,),

            ],
          )),
          Positioned(
            top:Dimentions.height20*5,
              left: Dimentions.width20,
              right: Dimentions.width20,
              bottom: 0,
              child: Container(
                // color: Colors.red,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                     child: GetBuilder<CartController>(
                         builder: (cartController){
                       var _cartList = cartController.getItems;
                       return ListView.builder(
                           itemCount: _cartList.length,
                           itemBuilder: (_,index){
                             return Container(
                               width: double.maxFinite,
                               height: 100,
                               // color:Colors.blue,
                               child: Row(
                                 children: [
                                  GestureDetector(
                                   onTap: () {
                                 // 1) Cart থেকে যেই product এ ক্লিক করা হয়েছে, তার ID নাও
                                 int productId = _cartList[index].product.id!;

                             // 2) Popular এবং Recommended controller নাও (GetX থেকে)
                             var popularController = Get.find<PopularProductController>();
                             var recommendedController = Get.find<RecommendedProductController>();

                             // 3) Popular list এ খুঁজে দেখো এই product আছে কিনা
                             int popularIndex = popularController.popularProductList
                                 .indexWhere((p) => p.id == productId);

                             if (popularIndex >= 0) {
                               // যদি popular এ পাওয়া যায় → popular detail page এ যাও
                               Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cart"));
                             } else {
                               // 4) না হলে recommended list এ খুঁজো
                               int recommendedIndex = recommendedController.recommendedProductList
                                   .indexWhere((p) => p.id == productId);

                               if (recommendedIndex >= 0) {
                                 // যদি recommended এ পাওয়া যায় → recommended detail page এ যাও
                                 Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cart"));
                               } else {
                                 // 5) কোথাও না পেলে error দেখাও
                                 Get.snackbar("Error", "Product not found");
                               }
                             }
                           },


                             child: Container(
                                    width: Dimentions.height20*5,
                               height: Dimentions.height20*5,
                               margin: EdgeInsets.only(bottom: Dimentions.height10),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(Dimentions.radius20),
                                   image: DecorationImage(
                                       fit: BoxFit.cover,
                                       image: NetworkImage(
                                         AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!,
                                       ))
                               ),
                             ),
                                  ),
                                   SizedBox(width:Dimentions.width10 ,),
                                   Expanded(
                                       child: SizedBox(
                                         height: Dimentions.height20*5,
                                         child:  Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: [
                                             Bigtext(text: cartController.getItems[index].name!),
                                             Smalltext(text: "spicy",color: Colors.black54,),
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Bigtext(text: cartController.getItems[index]!.price.toString(),color: Colors.red,),
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
                                                             cartController.addItem(_cartList[index].product, -1);
                                                           },
                                                           child: Icon(Icons.remove,color: Colors.black,)),
                                                       SizedBox(width: Dimentions.width10,),
                                                       Bigtext(text:_cartList[index].quantity.toString(),
                                                         //  text: popularProduct.inCartItems.toString()
                                                       ),
                                                       SizedBox(width: Dimentions.width10,),
                                                       GestureDetector(
                                                           onTap: (){
                                                             cartController.addItem(_cartList[index].product, 1);
                                                           },
                                                           child: Icon(Icons.add,color: Colors.black,)),                  ],
                                                   ),
                                                 ),
                                               ],
                                             )



                                           ],
                                         ),
                                       ))
                                 ],
                               ),

                             );
                           }
                       );
                     })
                )
              )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
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

                    SizedBox(width: Dimentions.width10,),
                    Bigtext(text: "\$${cartController.totalAmount}"),
                    SizedBox(width: Dimentions.width10,),
                                  ],
                ),
              ),

              GestureDetector(
                onTap:(){

                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimentions.height10,bottom: Dimentions.height10,right: Dimentions.width20,left: Dimentions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius20),
                      color: Colors.tealAccent.shade700
                  ),

                  child: Bigtext(text: " Check Out",
                      color:Colors.white),
                ),
              )


            ],
          ),

        );
      }),

    );
  }
}
