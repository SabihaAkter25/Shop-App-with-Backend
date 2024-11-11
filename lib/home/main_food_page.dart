import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';

import '../utils/dimantions.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(MediaQuery.of(context).size.height.toString());
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimantions.height45,bottom: Dimantions.height15),
            padding: const EdgeInsets.only(left:20,right: 20 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Bangladesh",color: Colors.tealAccent.shade700,),
                    Row(
                      children: [
                        SmallText(text: "Dhaka",color: Colors.black45,),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimantions.height45,
                    height: Dimantions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:Colors.tealAccent.shade700,

                    ),
                    child: Icon(Icons.search,color: Colors.white,size: Dimantions.iconSize24,),
                  ),
                )
              ],
            ),
          ),
          const FoodPageBody(),
        ],
      ),
    );
  }
}
