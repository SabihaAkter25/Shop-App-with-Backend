import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecomendedFoodDetail extends StatelessWidget {
  const RecomendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(preferredSize: Size.fromHeight(0),
                child: Container(
                  color: Colors.white,
                child: Center(child: Text("Sliver app bar")),
                width: double.maxFinite,
                  padding: EdgeInsets.only(bottom: 10),
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
            child: Text("Food is any substance"
                " consumed by an organism for"
                " nutritional support. Food is"
                " usually of plant, animal, or "
                "fungal origin and contains "
                "essential nutrients such as"
                " carbohydrates, fats, proteins,"
                " vitamins, or minerals. "
                "The substance is ingested by an organism "
                "and assimilated by the organism's cells to provide energy, "
                "maintain life, or stimulate growth."
                " Different species of animals have"
                " different feeding behaviours that"
                " satisfy the needs of their metabolisms"
                " and have evolved to fill a specific ecological"
                " niche within specific geographical contexts"
                "Food is any substance"
                " consumed by an organism for"
                " nutritional support. Food is"
                " usually of plant, animal, or "
                "fungal origin and contains "
                "essential nutrients such as"
                " carbohydrates, fats, proteins,"
                " vitamins, or minerals. "
                "The substance is ingested by an organism "
                "and assimilated by the organism's cells to provide energy, "
                "maintain life, or stimulate growth."
                " Different species of animals have"
                " different feeding behaviours that"
                " satisfy the needs of their metabolisms"
                " and have evolved to fill a specific ecological"
                " niche within specific geographical contexts"
                "Food is any substance"
                " consumed by an organism for"
                " nutritional support. Food is"
                " usually of plant, animal, or "
                "fungal origin and contains "
                "essential nutrients such as"
                " carbohydrates, fats, proteins,"
                " vitamins, or minerals. "
                "The substance is ingested by an organism "
                "and assimilated by the organism's cells to provide energy, "
                "maintain life, or stimulate growth."
                " Different species of animals have"
                " different feeding behaviours that"
                " satisfy the needs of their metabolisms"
                " and have evolved to fill a specific ecological"
                " niche within specific geographical contexts"
                "Food is any substance"
                " consumed by an organism for"
                " nutritional support. Food is"
                " usually of plant, animal, or "
                "fungal origin and contains "
                "essential nutrients such as"
                " carbohydrates, fats, proteins,"
                " vitamins, or minerals. "
                "The substance is ingested by an organism "
                "and assimilated by the organism's cells to provide energy, "
                "maintain life, or stimulate growth."
                " Different species of animals have"
                " different feeding behaviours that"
                " satisfy the needs of their metabolisms"
                " and have evolved to fill a specific ecological"
                " niche within specific geographical contexts"
                "Food is any substance"
                " consumed by an organism for"
                " nutritional support. Food is"
                " usually of plant, animal, or "
                "fungal origin and contains "
                "essential nutrients such as"
                " carbohydrates, fats, proteins,"
                " vitamins, or minerals. "
                "The substance is ingested by an organism "
                "and assimilated by the organism's cells to provide energy, "
                "maintain life, or stimulate growth."
                " Different species of animals have"
                " different feeding behaviours that"
                " satisfy the needs of their metabolisms"
                " and have evolved to fill a specific ecological"
                " niche within specific geographical contexts"
                "Food is any substance"
                " consumed by an organism for"
                " nutritional support. Food is"
                " usually of plant, animal, or "
                "fungal origin and contains "
                "essential nutrients such as"
                " carbohydrates, fats, proteins,"
                " vitamins, or minerals. "
                "The substance is ingested by an organism "
                "and assimilated by the organism's cells to provide energy, "
                "maintain life, or stimulate growth."
                " Different species of animals have"
                " different feeding behaviours that"
                " satisfy the needs of their metabolisms"
                " and have evolved to fill a specific ecological"
                " niche within specific geographical contexts")
          )
        ],
      ),
    );
  }
}
