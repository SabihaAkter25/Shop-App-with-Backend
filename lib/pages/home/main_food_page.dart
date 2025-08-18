import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:  Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40,left: 25,right: 25,bottom: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Bigtext(color: Colors.teal, text: "Bangladesh", ),
                      Row(
                        children: [
                          Smalltext(color: Colors.black54, text: "Dhaka"),
                          const Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ],

                  ),

                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.cyan,
                    ),
                    child: const Icon(Icons.search,color: Colors.white,),
                  ),
                ],
              ),
            ),
            const Expanded(child: SingleChildScrollView(child: FoodPageBody(),))
          ],
        )
    );
  }
}
