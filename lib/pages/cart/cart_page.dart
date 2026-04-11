import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_with_backend/Base/no_data_page.dart';
import 'package:shop_app_with_backend/controller/cart_controller.dart';
import 'package:shop_app_with_backend/routes/route_helper.dart';
import 'package:shop_app_with_backend/utils/dimentions.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';
import 'package:shop_app_with_backend/controller/popular_product_controller.dart';
import 'package:shop_app_with_backend/controller/recommended_product_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          /// 🔹 TOP ICONS
          Positioned(
            left: Dimentions.width20,
            right: Dimentions.width20,
            top: Dimentions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  backgroundColor: Colors.tealAccent.shade700,
                  iconColor: Colors.white,
                ),

                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    backgroundColor: Colors.tealAccent.shade700,
                    iconColor: Colors.white,
                  ),
                ),

                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  backgroundColor: Colors.tealAccent.shade700,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),

          /// 🔹 CART LIST
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getItems.isNotEmpty?Positioned(
              top: Dimentions.height20 * 5,
              left: Dimentions.width20,
              right: Dimentions.width20,
              bottom: 0,
              child: GetBuilder<CartController>(
                builder: (cartController) {
                  var cartList = cartController.getItems;

                  return ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (_, index) {

                      /// 🔥 IMAGE FIX (MOST IMPORTANT)
                      var product = cartList[index].product;

                      String imageUrl =
                          product?.thumbnail ??
                              product?.img ??
                              cartList[index].img ??
                              "";

                      return Container(
                        margin: EdgeInsets.only(bottom: Dimentions.height10),
                        child: Row(
                          children: [

                            /// 🔹 IMAGE BOX
                            GestureDetector(
                              onTap: () {
                                int? productId = cartList[index].product?.id;

                                var popularController =
                                Get.find<PopularProductController>();
                                var recommendedController =
                                Get.find<RecommendedProductController>();

                                int popularIndex = popularController
                                    .popularProductList
                                    .indexWhere((p) => p.id == productId);

                                if (popularIndex >= 0) {
                                  Get.toNamed(
                                      RouteHelper.getPopularFood(popularIndex, "cart"));
                                } else {
                                  int recommendedIndex =
                                  recommendedController.recommendedProductList
                                      .indexWhere((p) => p.id == productId);

                                  if (recommendedIndex >= 0) {
                                    Get.toNamed(RouteHelper.getRecommendedFood(
                                        recommendedIndex, "cart"));
                                  } else {
                                    Get.snackbar("Error", "Product not found");
                                  }
                                }
                              },
                              child: Container(
                                width: Dimentions.height20 * 5,
                                height: Dimentions.height20 * 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimentions.radius20),

                                  /// ✅ SAFE IMAGE LOAD
                                  image: imageUrl.isNotEmpty
                                      ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(imageUrl),
                                  )
                                      : null,
                                ),

                                /// ❌ যদি image না থাকে
                                child: imageUrl.isEmpty
                                    ? const Icon(Icons.image_not_supported)
                                    : null,
                              ),
                            ),

                            SizedBox(width: Dimentions.width10),

                            /// 🔹 DETAILS
                            Expanded(
                              child: SizedBox(
                                height: Dimentions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Bigtext(text: cartList[index].name ?? ""),
                                    Smalltext(
                                        text: "spicy",
                                        color: Colors.black54),

                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Bigtext(
                                          text:
                                          "\$${cartList[index].price ?? 0}",
                                          color: Colors.red,
                                        ),

                                        /// 🔹 QUANTITY BUTTON
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: Dimentions.width20,
                                            vertical: Dimentions.height10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(
                                                Dimentions.radius20),
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  cartController.addItem(
                                                      cartList[index].product!,
                                                      -1);
                                                },
                                                child: const Icon(Icons.remove),
                                              ),

                                              SizedBox(
                                                  width: Dimentions.width10),

                                              Bigtext(
                                                text: cartList[index]
                                                    .quantity
                                                    .toString(),
                                              ),

                                              SizedBox(
                                                  width: Dimentions.width10),

                                              GestureDetector(
                                                onTap: () {
                                                  cartController.addItem(
                                                      cartList[index].product!,
                                                      1);
                                                },
                                                child: const Icon(Icons.add),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ):NoDataPage(text:"No Item in The Cart" ,);
          })
        ],
      ),

      /// 🔹 BOTTOM BAR
      bottomNavigationBar:
      GetBuilder<CartController>(builder: (cartController) {
        return Container(
          height: MediaQuery.of(context).size.height*0.09,
          padding: EdgeInsets.symmetric(
            horizontal: Dimentions.width20,
            vertical: Dimentions.height20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimentions.radius20 * 2),
              topRight: Radius.circular(Dimentions.radius20 * 2),
            ),
          ),
          child: cartController.getItems.length>0?Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// TOTAL PRICE
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimentions.width20,
                  vertical: Dimentions.height10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius:
                  BorderRadius.circular(Dimentions.radius20),
                ),
                child: Bigtext(
                    text: "\$${cartController.totalAmount}"),
              ),

              /// CHECKOUT
              GestureDetector(
                onTap: () {
                  cartController.addToCartHistory();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimentions.width20,
                    vertical: Dimentions.height10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.tealAccent.shade700,
                    borderRadius:
                    BorderRadius.circular(Dimentions.radius20),
                  ),
                  child: Bigtext(
                    text: "Check Out",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ):Container(),
        );
      }),
    );
  }
}