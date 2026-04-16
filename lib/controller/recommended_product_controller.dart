import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/product_model.dart';

class RecommendedProductController extends GetxController {

  final supabase = Supabase.instance.client;

  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  Future<void> getRecommendedProductList() async {

    final data = await supabase
        .from('products')
        .select();

    _recommendedProductList = (data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();

    _isloaded = true;
    update();
  }
}