import 'package:flutter/material.dart';
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
 double _scaleFactor = 0.8;
 double _height =220;

 @override
  void initState(){
    super.initState();
    pageController.addListener((){
      setState(() {
        _currPageValue=  pageController.page!;
      });
    });
 }
@override
 void dispose(){
   pageController.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height*0.35,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
          itemBuilder:(context,position)
      {
        return _buildPageItem(position);
      }),
    );
  }
  Widget _buildPageItem(int index){
   Matrix4 matrix = new Matrix4.identity();
   if(index == _currPageValue.floor()){
     var currScale = 1 - (_currPageValue - index)*(1-_scaleFactor);
     var currTrans = _height*(1-currScale)/2;
  matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
   }else if(index == _currPageValue.floor()+1){
     var currScale = _scaleFactor + (_currPageValue-index+1)*(1-_scaleFactor);
     var currTrans = _height*(1-currScale)/2;
     matrix = Matrix4.diagonal3Values(1, currScale, 1);
     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

   }else if(index == _currPageValue.floor()-1){
     var currScale = 1 - (_currPageValue - index)*(1-_scaleFactor);
     var currTrans = _height*(1-currScale)/2;
     matrix = Matrix4.diagonal3Values(1, currScale, 1);
     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

   }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
        Container(
        height: 220,
        margin: const EdgeInsets.only(left: 10,right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven? Colors.tealAccent : Colors.blue,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/food1.jpg",),
            )
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
        height: 140,
        margin: const EdgeInsets.only(left: 30,right: 30,bottom: 30),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        ),
          child: Container(
            padding: const EdgeInsets.only(top: 15, left:15,right: 15 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Chinese Side"),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(5, (index)=> Icon(Icons.star,color: Colors.teal.shade200,),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    SmallText(text: "4.5",),
                    const SizedBox(width: 10,),
                    SmallText(text: "1287",),
                    const SizedBox(width: 10,),
                    SmallText(text: "comments",),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.01),
      
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconAndText(
                    icon: Icons.circle_rounded,
                      text: "Normal",
                       iconColor: Colors.amberAccent,
                  ),
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.02),
      
                    IconAndText(
                      icon: Icons.location_on_sharp,
                      text: "1.7Km",
                      iconColor: Colors.cyan,
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.02),
      
                    IconAndText(
                      icon: Icons.access_time,
                      text: "32 min",
                      iconColor: Colors.redAccent,
                    ),
                ],)
      
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
