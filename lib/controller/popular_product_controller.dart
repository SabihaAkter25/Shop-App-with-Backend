
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_with_backend/model/cart_model.dart';
import '../data/api/repository/popular_product_repo.dart';
import '../model/product_model.dart';
import 'cart_controller.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList=[];
  List<ProductModel> get popularProductList => _popularProductList;
  bool _isLoaded=false;
  bool get isLoaded => _isLoaded;
  int _quantity=0;
  int get quantity =>_quantity;
  int _inCartItems=0;
  int get inCartItems => _inCartItems + _quantity;
  late CartController _cart;
  @override
  void onInit() {
    super.onInit();
    getPopularProductList();
  }
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      final product = Product.fromJson(response.body);
      _popularProductList = product.products;
      _isLoaded = true;
      update();
      print("Loaded: ${_popularProductList.length}");
    } else {
      print("Error fetching products: ${response.statusCode}");
    }
  }
  void setQuantity(bool isIncrement){
    if(isIncrement){
      print("increment "+quantity.toString());
      _quantity= checkQuantity(_quantity+1);
    }else{
      _quantity=  checkQuantity(_quantity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if((_inCartItems+quantity)<0){
      Get.snackbar("Item count", "You cant reduce more",
        backgroundColor: Colors.tealAccent.shade700,
        colorText: Colors.white,
      );
      if(_inCartItems>0){
        _quantity=-_inCartItems;
        return _quantity;
      }
      return 0;
    }else if((_inCartItems+quantity) >20){
      Get.snackbar("Item count", "You cant increase more",
        backgroundColor: Colors.tealAccent.shade700,
        colorText: Colors.white,
      );
      return 20;
    }
    return quantity;
  }

  void initProduct(ProductModel product, CartController cart){
    _quantity=0;
    _inCartItems=0;
    _cart =cart;
    var exist= false;
    exist = _cart.existInCart(product);

    if(exist){
      _inCartItems = _cart.getQuantity(product);
    }
    //if exist
    //get from storage _inCartItems=3
  }

  void addItem(ProductModel product){
    // if(quantity>0){
    _cart.addItem(product, _quantity);
    _quantity=0;
    _inCartItems =_cart.getQuantity(product);

    _cart.items.forEach((key,value){
      print("the id is "+value.id.toString()+"the quantity is "+value.quantity.toString());
    });

    update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel>get getItems{
    return _cart.getItems;
  }


}




