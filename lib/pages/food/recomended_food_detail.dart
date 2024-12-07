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
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/food3.jpg",
              width:double.maxFinite ,
              fit: BoxFit.cover,),
            ),
          ),

        ],
      ),
    );
  }
}
