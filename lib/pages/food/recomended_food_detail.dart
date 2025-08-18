import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/popular_product_controller.dart';
import '../../controller/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/dimentions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());

    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child:const AppIcon(icon: Icons.clear, ),
                    ),
                    // AppIcon(icon: Icons.shopping_cart_outlined,),
                    GetBuilder<PopularProductController>(builder:(controller){
                      return Stack(
                        children: [
                          const AppIcon(icon: Icons.shopping_cart_outlined,),
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

                  ]
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimentions.radius20),
                          topRight: Radius.circular(Dimentions.radius20),
                        )
                    ),

                    width: double.maxFinite,
                    child:Center(
                        child: Bigtext(text: product.name!,size: Dimentions.font26,)),
                  )
              ),
              backgroundColor:  Colors.orange,
              pinned: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                  width:double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ExpandableText(text: product.description!,)
                ],
              ),
            )

          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimentions.width20 * 5.5,
                  vertical: Dimentions.height10*2,
                ),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        backgroundColor: Colors.tealAccent.shade700,
                        icon: Icons.remove,
                        iconColor: Colors.white,

                      ),
                    ),
                    Bigtext(
                      text: "\$ ${product.price!}  X ${controller.inCartItems}",
                      color: Colors.black,
                      size: Dimentions.font26,
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        backgroundColor: Colors.tealAccent.shade700,
                        icon: Icons.add,
                        iconColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimentions.width30,
                  vertical: Dimentions.height20,
                ),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimentions.radius20 * 2),
                    topRight: Radius.circular(Dimentions.radius20 * 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimentions.height10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimentions.radius20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.tealAccent.shade700,
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        controller.addItem(product);
                      },
                      child:Container(
                        padding: EdgeInsets.all(Dimentions.height10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimentions.radius20),
                          color: Colors.tealAccent.shade700,
                        ),
                        child: Bigtext(
                          text: "\$ ${product.price!} | Add to cart",
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        })
    );
  }
}
