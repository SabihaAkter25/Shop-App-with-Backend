import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/widgets/app_icon.dart';

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
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
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
                  child: ExpandableTextWidget(text:
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
    );
  }
}
