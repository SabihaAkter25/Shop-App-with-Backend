import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../controller/cart_controller.dart';
import '../controller/popular_product_controller.dart';
import '../controller/recommended_product_controller.dart';
import '../data/api/repository/cart_repo.dart';

Future<void> init() async {

  // Supabase client
  final supabase = Supabase.instance.client;
  Get.lazyPut(() => supabase);

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Repo (ONLY cart now)
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  // Controllers
  Get.lazyPut(() => PopularProductController());
  Get.lazyPut(() => RecommendedProductController());
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

}