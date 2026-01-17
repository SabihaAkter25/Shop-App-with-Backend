import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_app_with_backend/routes/route_helper.dart';

import '../../controller/popular_product_controller.dart';
import '../../controller/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin{
  _loadResources(){
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState(){
    _loadResources();
    super.initState();
    controller= AnimationController(
        vsync: this,
        duration:const Duration(seconds:2))..forward();
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear);
    Future.delayed(const Duration(seconds: 3),(){
      Get.offNamed(RouteHelper.getInitial());
    });
    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
          child: Center(child: Image.asset( "assets/images/Logo.jpg",width: 290,))),
        ],
      ),
    );
  }
}
