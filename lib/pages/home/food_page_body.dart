import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_with_backend/controller/popular_product_controller.dart';
import 'package:shop_app_with_backend/controller/recommended_product_controller.dart';
import 'package:shop_app_with_backend/utils/app_constants.dart';
import 'package:shop_app_with_backend/utils/dimantions.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';
import 'package:shop_app_with_backend/widgets/icon_and_text.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';

import '../../routes/route_helper.dart';
import '../../widgets/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.8;
  final double _scaleFactor = 0.8;
  final double _height = Dimantions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Slider section

          GetBuilder<PopularProductController>(builder:(popularProducts){
          return popularProducts.isLoaded? SizedBox(
            height: Dimantions.pageView,


              child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, popularProducts.popularProductList[position]);
                },

            ),
          ) : CircularProgressIndicator(color: Colors.tealAccent.shade700,);
          },),

          // Dots Indicator
          GetBuilder<PopularProductController>(builder: (popularProducts){
            return DotsIndicator(
              dotsCount: popularProducts.popularProductList.isEmpty ? 1: popularProducts.popularProductList.length,
              position: _currPageValue,
              decorator: DotsDecorator(
                activeColor: Colors.tealAccent.shade700,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            );
          }
          ),



          // Popular text
          SizedBox(height: Dimantions.height30),
          Container(
             margin: EdgeInsets.only(left: Dimantions.height30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Recommended"),
                SizedBox(width: Dimantions.width10),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(
                    text: ".",
                  ),
                ),
                SizedBox(width: Dimantions.width10),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(
                    text: 'Food Paring',
                  ),
                ),
                SizedBox(width: Dimantions.width10),
              ],
            ),
          ),
          SizedBox(height: Dimantions.height15),
          // List of food and images
          GetBuilder<RecommendedProductController>(builder:(recommendedProduct){
            return recommendedProduct.isLoaded? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: Dimantions.height20),
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getRecommendedFood());
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: Dimantions.width20, right: Dimantions.width20,bottom: Dimantions.height10),
                    child: Row(
                      children: [
                        //Image section
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimantions.radius20),
                            color: Colors.black12,
                            image: DecorationImage(
                              image: NetworkImage(
                                  AppConstant.BASE_URL+AppConstant.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: Dimantions.listViewSize,
                          width:Dimantions.listViewSize,
                        ),
                        //Text section
                        Expanded(
                          child: Container(
                            height:Dimantions.listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight:Radius.circular(Dimantions.radius20),
                                  bottomRight:Radius.circular(Dimantions.radius20)),
                              color: Colors.white
                            ),
                            child: Padding(padding: EdgeInsets.only(left: Dimantions.width10),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                mainAxisAlignment:MainAxisAlignment.start,
                                children: [
                                  BigText(text:recommendedProduct.recommendedProductList[index].name!),
                                  SizedBox(height: Dimantions.height10,),
                                  SmallText(text: "With chinese characteristics"),
                                  SizedBox(height: Dimantions.height10,),
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
                        )
                  
                  
                      ],
                    ),
                  ),
                );
              },
            ):CircularProgressIndicator(
              color: Colors.tealAccent.shade700,
            );
          })
        ],
      ),
    );
  }

  Widget _buildPageItem(int index, popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimantions.pageViewContainer,
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimantions.radius30),
                color: index.isEven ? Colors.tealAccent : Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      AppConstant.BASE_URL+AppConstant.UPLOAD_URL+popularProduct.img!
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimantions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimantions.width20, right: Dimantions.width20, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimantions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Color(0xFFe8e8e8), blurRadius: 5.0, offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text:popularProduct.name!,),
                  SizedBox(height: Dimantions.height20,),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
