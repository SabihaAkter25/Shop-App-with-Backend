 import 'package:get/get.dart';
import 'package:shop_app_with_backend/pages/home/home_page.dart';
import '../pages/cart/cart_page.dart';
import '../pages/food/popular_food_detail.dart';
import '../pages/food/recomended_food_detail.dart';
import '../pages/home/main_food_page.dart';
import '../pages/splash/splash_screen.dart';

 class RouteHelper{


   static const String splash = "/splash_screen";
  static const String initial ="/";
  static const String popularFood ="/popular-food";
  static const String recommendedFood ="/recommended-food";
  static const String cartpage = "/cart-page";

  static String getSplash() => '$splash';
  static  String getInitial() =>'$initial';                                                   //এখানে / হল root route বা অ্যাপের শুরু পেজের path।
  static  String getPopularFood(int pageId, String page) =>'$popularFood?pageId=$pageId&page=$page';
  static  String getRecommendedFood(int pageId, String page) =>'$recommendedFood?pageId=$pageId&page=$page';
  static  String getCartPage()=> '$cartpage';

  static List<GetPage> routes=[

    GetPage(name:splash, page:()=>const SplashScreen()),
    GetPage(name: initial, page:()=> const HomePage()),
    GetPage(name: popularFood, page:(){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return PopolarFoodDetail( pageId: int.parse(pageId!),page:page!);
    },
      transition: Transition.fadeIn,
    ),
    GetPage(name: recommendedFood, page:(){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!),page:page!);
    },
      transition: Transition.fadeIn,
    ),
    GetPage(name:cartpage, page:(){
      return CartPage();
    },
      transition: Transition.fadeIn,
    )
  ];
}

