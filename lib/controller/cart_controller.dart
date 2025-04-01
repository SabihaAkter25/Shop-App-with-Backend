import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shop_app_with_backend/data/api/repository/cart_repo.dart';
import 'package:shop_app_with_backend/model/product_model.dart';
import '../model/cart_model.dart';
class CartController extends GetxController{
 final CartRepo cartRepo;
 CartController({required this.cartRepo});
Map<int, CartModel> _items ={};
void addItem(ProductElement product, int quantity){
if(quantity>0){
 _items.putIfAbsent(product.id!, () {
  print("Adding item to the cart "+ product.id!.toString() + "quantity "+quantity.toString());
  return CartModel(
      id: product.id,
      name: product.name,
      price: product.price,
      img: product.img,
      quantity: quantity,
      isExist: true,
      time: DateTime.now().toString());
 });
}
}

}