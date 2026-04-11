import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop_app_with_backend/Base/no_data_page.dart';
import 'package:shop_app_with_backend/controller/cart_controller.dart';
import 'package:shop_app_with_backend/model/cart_model.dart';
import 'package:shop_app_with_backend/routes/route_helper.dart';
import 'package:shop_app_with_backend/utils/dimentions.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';
import '../../widgets/small_text.dart';

  class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>()
        .getCartHistoryList().reversed.toList();

    // Count items per order time
    Map<String, int> cartItemPerOrder = {};
    for (var item in getCartHistoryList) {
      if (cartItemPerOrder.containsKey(item.time)) {
        cartItemPerOrder.update(item.time!, (value) => value + 1);
      } else {
        cartItemPerOrder.putIfAbsent(item.time!, () => 1);
      }
    }

    List<String> orderTimes = cartItemPerOrder.keys.toList();


    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            color: Colors.tealAccent.shade700,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Bigtext(text: "Cart History"),
                  const AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              ),
            ),
          ),

          // List of orders
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getCartHistoryList().isNotEmpty?
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(
                    top: Dimentions.height20,
                    left: Dimentions.height20,
                    right: Dimentions.height20,
                  ),
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      itemCount: orderTimes.length,
                      itemBuilder: (context, i) {

                        String orderTime = orderTimes[i];

                        DateTime parsedDate = DateTime.parse(orderTime);
                        String formattedDate = DateFormat('MM/dd/yyyy hh:mm a').format(parsedDate);
                        int itemCount = cartItemPerOrder[orderTime]!;

                        return Container(
                          margin: EdgeInsets.only(bottom: Dimentions.height20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Show order time


                              Bigtext(text: formattedDate),

                              SizedBox(height: Dimentions.height10),

                              // Images of products in this order
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(itemCount, (index) {
                                      if (listCounter < getCartHistoryList.length) {

                                        var product = getCartHistoryList[listCounter].product;
                                        listCounter++;

                                        String? imageUrl = product?.thumbnail;

                                        // ✅ FULL SAFE CHECK
                                        if (imageUrl == null || imageUrl.isEmpty) {
                                          return Container(
                                            height: 89,
                                            width: 80,
                                            margin: EdgeInsets.only(right: Dimentions.width10),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: const Icon(Icons.image_not_supported),
                                          );
                                        }

                                        return index<=2?Container(
                                          height: 89,
                                          width: 80,
                                          margin: EdgeInsets.only(right: Dimentions.width10),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                              imageUrl,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Icon(Icons.broken_image);
                                              },
                                            ),
                                          ),
                                        ):Container();
                                      } else {
                                        return SizedBox();
                                      }
                                    }),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        Smalltext(text:"tolal"),
                                        Bigtext(text: itemCount.toString()+" items",color: Colors.grey.shade700,),
                                        GestureDetector(
                                          onTap: (){
                                            Map<int, CartModel> moreOrder ={};
                                            for(int j=0; j<getCartHistoryList.length; j++){
                                              if(getCartHistoryList[j].time==orderTimes[i]){
                                                moreOrder.putIfAbsent(getCartHistoryList[j].id!, ()=>
                                                    CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j]))),
                                                );
                                              }
                                            }
                                            Get.find<CartController>().setIems = moreOrder;
                                            Get.find<CartController>().addToCartList();
                                            Get.toNamed(RouteHelper.getCartPage());
                                          },
                                          child: Container(
                                            width: Dimentions.width10*15,
                                            height: Dimentions.height20,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimentions.radius20/4),
                                              border: Border.all(width: 1,color: Colors.tealAccent.shade700),

                                            ),
                                            child: Center(child: Smalltext(text: "one more",color: Colors.tealAccent.shade700,)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),)
              ),
            ) :NoDataPage(text: "You didn't buy anything so far",imgPath: "assets/images/empty-box.avif",);
          })
        ],
      ),
    );
  }
}