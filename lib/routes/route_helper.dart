import 'package:get/get.dart';
import 'package:shop_app_with_backend/pages/food/popular_food_detail.dart';
import 'package:shop_app_with_backend/pages/home/main_food_page.dart';
import '../pages/food/recomended_food_detail.dart';

class RouteHelper{

  static const String initial ="/";
  static const String popularFood ="/popular-food";
  static const String recommendedFood ="/recommended-food";

  static  String getInitial() =>'$initial';
  static  String getPopularFood(int pageId) =>'$popularFood?pageId=$pageId';
  static  String getRecommendedFood(int pageId) =>'$recommendedFood?pageId=$pageId';


  static List<GetPage> routes=[
     GetPage(name: initial, page:()=> MainFoodPage()),
     GetPage(name: popularFood, page:(){
       var pageId = Get.parameters['pageId'];
       return PopularFoodDetail( pageId: int.parse(pageId!));
      },
       transition: Transition.fadeIn,
     ),
  GetPage(name: recommendedFood, page:(){
    var pageId = Get.parameters['pageId'];
  return RecommendedFoodDetail(pageId: int.parse(pageId!));
    },
    transition: Transition.fadeIn,
  )
   ];
}

