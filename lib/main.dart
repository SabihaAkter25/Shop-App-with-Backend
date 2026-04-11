import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/utils/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';
import 'package:shop_app_with_backend/controller/cart_controller.dart';
import 'package:shop_app_with_backend/controller/popular_product_controller.dart';
import 'package:shop_app_with_backend/controller/recommended_product_controller.dart';
import 'package:shop_app_with_backend/routes/route_helper.dart';
import 'helper/dependencies.dart'as dep;


Future<void> main() async {


WidgetsFlutterBinding.ensureInitialized();
await Supabase.initialize(
  url: 'https://byewtnbmkeyistabltqo.supabase.co',
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ5ZXd0bmJta2V5aXN0YWJsdHFvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzU3NTE0ODQsImV4cCI6MjA5MTMyNzQ4NH0.MGHEuZU2rjIIC1sE9brvbT8pWAcBdBc-3JFr8b8RvAg',
);

  await dep.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();

   return GetBuilder<PopularProductController>(builder: (_){
     return GetBuilder<RecommendedProductController>(builder: (_){
       return GetMaterialApp(
         debugShowCheckedModeBanner: false,

         initialRoute: RouteHelper.getSplash(),
         getPages: RouteHelper.routes,
       );
     },);
   });

  }
}
