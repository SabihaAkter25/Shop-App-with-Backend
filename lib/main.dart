import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_with_backend/controller/popular_product_controller.dart';
import 'package:shop_app_with_backend/pages/home/main_food_page.dart';
import 'controller/recommended_product_controller.dart';
import 'helper/dependencies.dart'as dep;
Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const MainFoodPage(),
    );
  }
}
