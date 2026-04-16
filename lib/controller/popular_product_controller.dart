import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_with_backend/model/cart_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/api/repository/popular_product_repo.dart';
import '../model/product_model.dart';
import 'cart_controller.dart';

class PopularProductController extends GetxController {


  final supabase = Supabase.instance.client;

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  late CartController _cart;

  Future<void> getPopularProductList() async {


    final data = await supabase
        .from('products')
        .select()
        .limit(15);

    _popularProductList = (data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();

    _isLoaded = true;
    update();
  }

  // ===== UI required methods (KEEP THESE) =====

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;

    bool exist = _cart.existInCart(product);

    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity++;
    } else {
      _quantity--;
    }

    update();
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    update();
  }

  int get totalItems => _cart.totalItems;
  List get getItems => _cart.getItems;
}




