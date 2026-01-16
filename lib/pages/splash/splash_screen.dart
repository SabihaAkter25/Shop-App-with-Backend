import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_app_with_backend/routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState(){
    super.initState();
    controller= AnimationController(
        vsync: this,
        duration:const Duration(seconds:2))..forward();
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear);
  }
  Timer(){
    const Duration(seconds: 3);
    ()=>Get.offNamed(RouteHelper.getInitial());
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
