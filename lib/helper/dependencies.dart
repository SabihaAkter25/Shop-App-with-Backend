import 'package:get/get.dart';
import 'package:shop_app_with_backend/controller/popular_product_controller.dart';
import 'package:shop_app_with_backend/data/api/api_client.dart';
import 'package:shop_app_with_backend/data/api/repository/popular_product_repo.dart';
import 'package:shop_app_with_backend/utils/app_constants.dart';

import '../controller/recommended_product_controller.dart';
import '../data/api/repository/recommended_product_repo.dart';

Future<void> init()async {
  // api client
Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstant.BASE_URL, token: 'token'));
//repos
Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>RecommendedProductRepo(apiClient: Get.find()));

//controllers
Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(()=>RecommendedProductController(recommendedProductRepo: Get.find()));

}

