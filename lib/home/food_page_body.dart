import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/utils/dimantions.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';
import 'package:shop_app_with_backend/widgets/icon_and_text.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';

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
          SizedBox(
            height: Dimantions.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              },
            ),
          ),
          // Dots Indicator
          DotsIndicator(
            dotsCount: 5,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: Colors.tealAccent.shade700,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          // Popular text
          SizedBox(height: Dimantions.height30),
          Container(
            margin: EdgeInsets.only(left: Dimantions.height30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Popular"),
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
          // List of food and images
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: Dimantions.height20),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: Dimantions.width20, right: Dimantions.width20,bottom: Dimantions.height10),
                child: Row(
                  children: [
                    //Image section
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimantions.radius20),
                        color: Colors.black12,
                        image: const DecorationImage(
                          image: AssetImage("assets/images/food1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 120,
                      width: 120,
                    ),
                    //Text section
                    Expanded(
                      child: Container(
                        height:100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight:Radius.circular(Dimantions.radius20),
                              bottomRight:Radius.circular(Dimantions.radius20)),
                        color: Colors.white,
                        ),
                     child: Padding(padding: EdgeInsets.only(left: Dimantions.width10),
                     child: Column(
                       children: [
                         BigText(text: "Nutritious fruit meal "),
                         SmallText(text: "With chinese characteristics"),

                       ],
                     ),
                     ),
                      ),
                    )


                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPageItem(int index) {
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
          Container(
            height: Dimantions.pageViewContainer,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimantions.radius30),
              color: index.isEven ? Colors.tealAccent : Colors.blue,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/food3.jpg"),
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
              child: Container(
                padding: EdgeInsets.only(top: Dimantions.height10, left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side"),
                    SizedBox(height: Dimantions.height10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                                (index) => Icon(
                              Icons.star,
                              color: Colors.teal.shade200,
                            ),
                          ),
                        ),
                        SizedBox(width: Dimantions.width10),
                        SmallText(text: "4.5"),
                        SizedBox(width: Dimantions.width10),
                        SmallText(text: "1287"),
                        SizedBox(width: Dimantions.width10),
                        SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(height: Dimantions.height10),
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
          ),
        ],
      ),
    );
  }
}
