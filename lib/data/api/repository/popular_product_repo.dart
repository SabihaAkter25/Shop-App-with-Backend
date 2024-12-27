import 'package:get/get.dart';
import 'package:shop_app_with_backend/data/api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData("http://mvs.bslmeiyu.com/api/v1/products/popular");
  }
}