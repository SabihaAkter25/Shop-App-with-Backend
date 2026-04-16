import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RecommendedProductRepo extends GetxService {
  final supabase = Supabase.instance.client;

  Future<List<dynamic>> getRecommendedProductList() async {
    final response = await supabase
        .from('products')
        .select()
        .ilike('title', '%phone%');

    return response;
  }
}