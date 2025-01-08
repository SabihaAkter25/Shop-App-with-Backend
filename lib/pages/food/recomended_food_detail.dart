import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_with_backend/controller/recommended_product_controller.dart';
import 'package:shop_app_with_backend/routes/route_helper.dart';
import 'package:shop_app_with_backend/utils/app_constants.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';
import '../../utils/dimantions.dart';
import '../../widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    // Fetch the controller and product
    final product= Get.find<RecommendedProductController>().recommendedProductList[pageId];
 
    print("the Page id is "+ pageId.toString());
    print("the Product name is "+ product.name.toString());

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
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear, color: Colors.black),
                ),
                const AppIcon(icon: Icons.shopping_cart_outlined, color: Colors.black),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimantions.radius20),
                    topRight: Radius.circular(Dimantions.radius20),
                  ),
                ),
                child: Center(
                  child: Text(
                    product.name ?? "Product Name",
                    style: TextStyle(
                      fontSize: Dimantions.height20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.tealAccent.shade700,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstant.BASE_URL + AppConstant.UPLOAD_URL + (product.img ?? ""),
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimantions.width20,
                    right: Dimantions.width20,
                    bottom: Dimantions.height20,
                  ),
                  child: ExpandableTextWidget(
                    text: product.description! ?? "No description available.",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimantions.width20 * 2.5,
              vertical: Dimantions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  backgroundColor: Colors.tealAccent.shade700,
                  color: Colors.white,
                  icon: Icons.remove,
                ),
                BigText(
                  text: "\$${product.price} X 0",
                  color: Colors.black,
                  size: Dimantions.font26,
                ),
                AppIcon(
                  backgroundColor: Colors.tealAccent.shade700,
                  icon: Icons.add,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            height: Dimantions.bottomHeightBar,
            padding: EdgeInsets.symmetric(
              horizontal: Dimantions.width10,
              vertical: Dimantions.height20,
            ),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimantions.radius15 * 2),
                topRight: Radius.circular(Dimantions.radius15 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimantions.height10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimantions.radius15),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.tealAccent.shade700,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(Dimantions.height10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimantions.radius15),
                    color: Colors.tealAccent.shade700,
                  ),
                  child: BigText(
                    text: "\$${product.price} | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
