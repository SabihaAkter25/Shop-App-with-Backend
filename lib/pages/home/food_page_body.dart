import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/popular_product_controller.dart';
import '../../controller/recommended_product_controller.dart';
import '../../model/product_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/dimentions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';
import '../food/popular_food_detail.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});


  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;
  @override

  void initState(){
    super.initState();
    pageController.addListener((){
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }


  @override
  void   dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("current height is ${MediaQuery.of(context).size.height}");


    return  Column(
      children: [

        // Slider section
        GetBuilder<PopularProductController>(builder: (PopularProducts){ //PopularProducts এটা controller-এর current state ধরে রাখে। এই instance হচ্ছে dependency injection দিয়ে রেজিস্টার করা সেই controller (যেটা তুমি Get.lazyPut বা Get.put দিয়ে init করেছিলে)।
          return  PopularProducts.isLoaded? Container(

            height: Dimentions.PageView,
            child: PageView.builder(
                controller:pageController ,
                itemCount: PopularProducts.popularProductList.length,
                itemBuilder: (context,position){
                  return _buildPageItem(position,PopularProducts.popularProductList[position]);
                }

            ),
          ) : CircularProgressIndicator(
            color: Colors.tealAccent.shade700,
          );

        }
        ),
        //dots

        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: Colors.teal,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        // Popular text
        SizedBox(height: Dimentions.height30,),
        Container(
            margin: EdgeInsets.only(left: Dimentions.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Bigtext( text: "Recommended"),
                SizedBox(width: Dimentions.width10,),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: Bigtext(text: ".",color:Colors.black26),

                ),
                SizedBox(width: Dimentions.width10,),
                Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child:Smalltext(color: Colors.black26, text: "Food paring")),
              ],
            )


        ),

        // Recommended
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isloaded? Container(
              height: 1320,
              child:  ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context,index)
                  {
                    return GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.getRecommendedFood(index,"Recommeneded"));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: Dimentions.width20,right: Dimentions.width20,bottom: Dimentions.height10),
                        child: Row(
                          children: [
                            Container(
                              height: Dimentions.ListViewImgSize,
                              width:Dimentions.ListViewImgSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit:BoxFit.cover,
                                    image: NetworkImage(
                                      AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!,
                                    ),
                                  )
                              ),

                            ),
                            Expanded(
                              child: Container(

                                height: Dimentions.ListViewTextSize,
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(Dimentions.radius20,),
                                    bottomRight: Radius.circular(Dimentions.radius20,),
                                  ),
                                  color: Colors.white,

                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: Dimentions.width20,top: Dimentions.height10,bottom: Dimentions.height10,right: Dimentions.width10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Bigtext(text: recommendedProduct.recommendedProductList[index].name!),
                                      Smalltext(color: Colors.black54, text: "With chinese charachteristics"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconTextWidget(
                                              icon: Icons.circle_sharp,
                                              text: "Normal",
                                              iconColor: Colors.orange),

                                           IconTextWidget(
                                              icon: Icons.location_on,
                                              text: "Location",
                                              iconColor: Colors.tealAccent),

                                           IconTextWidget(
                                              icon: Icons.access_time_rounded,
                                              text: "32min",
                                              iconColor: Colors.orange),
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
                  }
              )
          ):CircularProgressIndicator(color: Colors.tealAccent.shade700,);
        })

      ],
    );
  }



  Widget _buildPageItem(int index, ProductModel popularProduct){

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
              Get.toNamed(RouteHelper.getPopularFood(index,"Popular"));
            },
            child: Container(
              height: Dimentions.pageViewContainer,
              margin: const EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven?Colors.blue:Colors.black26,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!
                      ))
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimentions.pageViewTextContainer,
              margin: const EdgeInsets.only(left: 40,right: 40,bottom: 15, ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    )
                  ]
              ),

              child: Container(
                padding: const EdgeInsets.only(top:15, left: 20, right: 20 ),
                child: AppColumn(text: popularProduct.name!,),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
