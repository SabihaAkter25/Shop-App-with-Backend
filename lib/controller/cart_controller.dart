import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/cart_model.dart';
import '../data/api/repository/cart_repo.dart';
import '../model/product_model.dart';


class CartController extends GetxController{

  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items={};
  Map<int, CartModel> get items =>_items;
  void addItem(ProductModel product, int quantity){
    var totalQuantity=0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value){
        totalQuantity = value.quantity!+quantity;

        return CartModel(
            id:value.id,
            name:value.name,
            price:value.price,
            img:value.img,
            quantity:value.quantity!+quantity,
            isExist:true,
            time:DateTime.now().toString()
        );
      }
      );
      if(totalQuantity<=0){
        _items.remove(product.id);
      }
    }else{
      if(quantity>0){
        _items.putIfAbsent(product.id!,(){
          return CartModel(
              id:product.id,
              name:product.name,
              price:product.price,
              img:product.img,
              quantity:quantity,
              isExist:true,
              time:DateTime.now().toString()
          );
        }
        );

      }else{
        Get.snackbar("Item count", "You must add at least an item",
          backgroundColor: Colors.tealAccent.shade700,
          colorText: Colors.white,
        );
      }
    }
  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }else{
      return false;
    }
  }
  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity=0;
    _items.forEach((key, value){
      totalQuantity += value.quantity!;

    });
    return totalQuantity;

  }

}