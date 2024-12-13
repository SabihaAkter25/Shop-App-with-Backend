import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';
import 'package:shop_app_with_backend/widgets/big_text.dart';

import '../../utils/dimantions.dart';
import '../../widgets/expandable_text_widget.dart';

class RecomendedFoodDetail extends StatelessWidget {
   const RecomendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear, color: Colors.black,),
                AppIcon(icon: Icons.shopping_cart_outlined, color: Colors.black,)
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
                  )
                ),
                child: Center(child: Text("Chinese Side",style: TextStyle(
                  fontSize: Dimantions.height20,fontWeight: FontWeight.bold
                ),)),
                )),
            backgroundColor: Colors.tealAccent.shade700,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/food3.jpg",
              width:double.maxFinite ,
              fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin:EdgeInsets.only(left: Dimantions.width20,right: Dimantions.width20,bottom: Dimantions.height20),
                  child: const ExpandableTextWidget(text:
          "  Food is any substance consumed by "
            "an organism for nutritional support. Food is usually of plant,"
          " animal, or fungal origin and contains essential nutrients    "
         "such as carbohydrates, fats, proteins, vitamins, or minerals."
          "The substance is ingested by an organism and assimilated by the organism"
    "cells to provide energy, maintain life, or stimulate growth."
"            Different species of animals have different feeding behaviours that"
"            satisfy the needs of their metabolisms and have evolved to fill a "
           " specific ecological niche within specific geographical contexts."

            "Omnivorous humans are highly adaptable and have adapted to obtain "
            "food in many different ecosystems. Humans generally use cooking to"
            "prepare food for consumption. The majority of the food energy required is"
            "supplied by the industrial food industry, which produces food through "
            "intensive agriculture and distributes it through complex food processing "
            "and food distribution systems. This system of conventional agriculture"
             "   relies heavily on fossil fuels, which means that the food and agricultural"
            "systems are one of the major contributors to climate change, accounting for"
                "as much as 37% of total greenhouse gas emissions.[1]"

            "The food system has significant impacts on a wide range of other social and political issues, including sustainability, biological diversity, economics, population growth, water supply, and food security. Food safety and security are monitored by international agencies like the International Association for Food Protection, the World Resources Institute, the World Food Programme, the Food and Agriculture Organization, and the International Food Information Council." ,),
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Container(
           padding: EdgeInsets.only(
             left: Dimantions.width20*2.5,
             right: Dimantions.width20*2.5,
             top: Dimantions.height10,
             bottom: Dimantions.height10,
           ),
           child:  Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               AppIcon(backgroundColor:Colors.tealAccent.shade700,color:Colors.white, icon: Icons.remove,),
               BigText(text: "\$12.88"+" X "+"0",color: Colors.black,size: Dimantions.font26,),
               AppIcon(backgroundColor:Colors.tealAccent.shade700,icon: Icons.add, color: Colors.white,)
             ],
           ),
         ),
          Container(
            height: Dimantions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimantions.height20,
              bottom: Dimantions.height20,
              left: Dimantions.width10,
              right: Dimantions.width10,
            ),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimantions.radius15*2),
                  topRight: Radius.circular(Dimantions.radius15*2),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimantions.height10,
                      bottom:Dimantions.height10,
                      right: Dimantions.width10,
                      left: Dimantions.width10 ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimantions.radius15),
                      color: Colors.white
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.remove,color: Colors.black45,),
                      SizedBox(width: Dimantions.width10,),
                      BigText(text: '0'),
                      SizedBox(width: Dimantions.width10,),
                      const Icon(Icons.add,color: Colors.black45,),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimantions.height10,
                      bottom:Dimantions.height10,
                      right: Dimantions.width10,
                      left: Dimantions.width10 ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimantions.radius15),
                    color: Colors.tealAccent.shade700,
                  ),
                  child: BigText(text: "\$10 | Add to cart", color: Colors.white,),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
