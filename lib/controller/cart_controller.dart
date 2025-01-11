import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shop_app_with_backend/data/api/repository/cart_repo.dart';

class CartController extends GetxController{
 final CartRepo cartRepo;
 CartController({required this.cartRepo});


}