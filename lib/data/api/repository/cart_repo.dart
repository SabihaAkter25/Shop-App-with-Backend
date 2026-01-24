import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_backend/utils/app_constants.dart';

import '../../../model/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCart(List<CartModel> cartList) {
    List<String> cart = [];

    for (var element in cartList) {
      cart.add(jsonEncode(element.toJson())); // ✅ FIXED
    }

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    print(sharedPreferences.getStringList(AppConstants.CART_LIST));
  }

  List<CartModel>getCartList() {
    List<String>? carts =[];
    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      carts=sharedPreferences.getStringList(AppConstants.CART_LIST);
    }
    List<CartModel> cartList = [];

    carts?.forEach((element){
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartList;
  }
}

