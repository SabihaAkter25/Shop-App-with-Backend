import 'package:get/get.dart';
import '../pages/food/popular_food_detail.dart';
import '../pages/food/recomended_food_detail.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper{

  static const String initial ="/";
  static const String popularFood ="/popular-food";
  static const String recommendedFood ="/recommended-food";

  static  String getInitial() =>'$initial';                                                   //এখানে / হল root route বা অ্যাপের শুরু পেজের path।
  static  String getPopularFood(int pageId) =>'$popularFood?pageId=$pageId';
  static  String getRecommendedFood(int pageId) =>'$recommendedFood?pageId=$pageId';

  static List<GetPage> routes=[

    GetPage(name: initial, page:()=> MainFoodPage()),
    GetPage(name: popularFood, page:(){
      var pageId = Get.parameters['pageId'];
      return PopolarFoodDetail( pageId: int.parse(pageId!));
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

