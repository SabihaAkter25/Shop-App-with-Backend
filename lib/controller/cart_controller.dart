import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/cart_model.dart';
import '../data/api/repository/cart_repo.dart';
import '../model/product_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  late Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  List<CartModel> storageItems = [];

  // Add item to cart
  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;

    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: value.product,
        );
      });

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            thumbnail: product.thumbnail,   // optional
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
            img: product.img,  //  MUST (VERY IMPORTANT)
          );
        });
      } else {
        Get.snackbar(
          "Item count",
          "You must add at least an item",
          backgroundColor: Colors.tealAccent.shade700,
          colorText: Colors.white,
        );
      }
    }

    cartRepo.addToCartList(getItems.cast<CartModel>());
    update();
  }

  // Check if product exists in cart
  bool existInCart(ProductModel product) {
    return _items.containsKey(product.id);
  }

  // Get quantity of a product in cart
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

  // Get total items in cart
  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  // Get all items as list
  List<CartModel> get getItems {
    return _items.entries.map((e) => e.value).toList();
  }

  // Get total amount
  double get totalAmount {
    double total = 0;
    _items.forEach((key, value) {
      total += (value.price! * value.quantity!);
    });
    return total;
  }

  // Get cart data from storage
  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  // Set cart data from storage
  set setCart(List<CartModel> items) {
    storageItems = items;

    for (int i = 0; i < storageItems.length; i++) {
      final product = storageItems[i].product;

      if (product != null && product.id != null) {
        _items.putIfAbsent(product.id!, () => storageItems[i]);
      }
    }
  }

  // Add to cart history
  void addToCartHistory() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  // Clear cart
  void clear() {
    _items = {};
    update();
  }

  // Get cart history
  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }
  set setIems(Map<int, CartModel>setItems) {
    _items = {};
  _items = setItems;
  }
 void addToCartList(){
    cartRepo.addToCartList(getItems);
    update();
 }
}