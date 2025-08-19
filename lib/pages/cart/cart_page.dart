import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_with_backend/controller/cart_controller.dart';
import 'package:shop_app_with_backend/pages/home/main_food_page.dart';
import 'package:shop_app_with_backend/utils/app_constants.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';
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
                  Get.to(()=>MainFoodPage());
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
                     child: GetBuilder<CartController>(builder: (cartController){
                       return ListView.builder(
                           itemCount: cartController.getItems.length,
                           itemBuilder: (_,index){
                             return Container(
                               width: double.maxFinite,
                               height: 100,
                               // color:Colors.blue,
                               child: Row(
                                 children: [
                                   Container(
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
                                                             //   popularProduct.setQuantity(false);
                                                           },
                                                           child: Icon(Icons.remove,color: Colors.black,)),
                                                       SizedBox(width: Dimentions.width10,),
                                                       Bigtext(text:"0",
                                                         //  text: popularProduct.inCartItems.toString()
                                                       ),
                                                       SizedBox(width: Dimentions.width10,),
                                                       GestureDetector(
                                                           onTap: (){
                                                             //   popularProduct.setQuantity(true);
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
    );
  }
}
