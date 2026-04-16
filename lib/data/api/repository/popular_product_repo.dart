import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class PopularProductRepo extends GetxService {
  final supabase = Supabase.instance.client;

  Future<List<dynamic>> getPopularProductList() async {
    final response = await supabase
        .from('products')
        .select();

    return response;
  }
}