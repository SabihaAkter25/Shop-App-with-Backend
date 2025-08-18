import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../controller/popular_product_controller.dart';
import '../controller/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/api/repository/cart_repo.dart';
import '../data/api/repository/popular_product_repo.dart';
import '../data/api/repository/recommended_product_repo.dart';
import '../utils/app_constants.dart';

Future<void>init()async{
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, token: ''));           //ApiClient class টিকে Get.lazyPut() দিয়ে register করা হয়েছে।

  //lazyPut মানে হলো যখন দরকার হবে তখনই object তৈরি হবে (lazy loading).

  //appBaseUrl: "" এখনো ঠিক করা হয়নি, মানে এটা default বা placeholder URL।
//repos
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));                  //এখানে PopularProductRepo নামে একটা repository তৈরি করা হয়েছে এবং এর মধ্যে ApiClient inject করা হয়েছে Get.find() দিয়ে।
  Get.lazyPut(()=>RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>CartRepo());
  // Get.find() GetX-এর method যেটা আগে register করা instance কে খুঁজে বের করে দেয় (এই ক্ষেত্রে ApiClient)।

//controller
  Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));     //এখানে PopularProductController register করা হয়েছে এবং তার মধ্যে PopularProductRepo inject করা হয়েছে Get.find() দিয়ে।
  Get.lazyPut(()=>RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut (()=>CartController(cartRepo: Get.find()));
}

// shob controller ekta file e load kora holo