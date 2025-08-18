import 'package:get/get.dart';

import '../data/api/repository/recommended_product_repo.dart';
import '../model/product_model.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductModel> _recommendedProductList=[];
  List<ProductModel> get recommendedProductList =>_recommendedProductList;
  bool _isloaded = false;
  bool get isloaded => _isloaded;

  Future<void> getRecommendedProductList()async{
    Response response = await recommendedProductRepo.getRecommendedProductList();

    if(response.statusCode==200){

      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isloaded = true;
      update();
    }else{
      print("Error fetching products: ${response.statusCode}");

    }
  }
}





