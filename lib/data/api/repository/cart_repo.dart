import 'dart:convert';                                        //➡️ JSON encode/decode korar jonno use hoy    jsonEncode() → Object → String jsonDecode() → String → Map/Object
import 'package:shared_preferences/shared_preferences.dart';  //➡️ Phone er local storage e small data save korar package Cart data app close korleo thakbe.
import 'package:shop_app_with_backend/utils/app_constants.dart';
import '../../../model/cart_model.dart';                                                    //➡️ CartModel class use korar jonno  Mane product + quantity + price etc je cart e thake

class CartRepo {                                              //➡️ Eta Repository class  Cart data save & load korar kaj kore
  final SharedPreferences sharedPreferences;                  //➡️ SharedPreferences object ta receive korbe  Final = ekbar assign hole change hobe na

  List<String> cart = [];
  List<String> cartHistory =[];
  CartRepo({required this.sharedPreferences} );                //➡️ Constructor Jokhon CartRepo banaba tokhon SharedPreferences pass korte hobe


  void addToCartList(List<CartModel> cartList) {
   // sharedPreferences.remove(AppConstants.CART_LIST);                                                                //➡️ CartModel er list nibe (mane pura cart items)
   // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);                                                                //➡️ CartModel er list nibe (mane pura cart items)
    cart = [];                                                   //➡️ Notun ekta empty String list banano holo Ekhane amra JSON string gula rakhbo
      var time = DateTime.now().toString();
    for (var element in cartList) {
       element.time =  time;                                                          //Loop ta ki korche?1️⃣ element = ekta CartModel object 2️⃣ element.toJson() → Object ke Map e convert kore 3️⃣ jsonEncode() → Map ke String e convert kore 4️⃣ Sei String list e add kore📦 Result:CartModel object → JSON String → List<String>
      cart.add(jsonEncode(element.toJson()));
    }

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);       //➡️ Ei JSON string list ta phone storage e save korche Key name = CART_LIST
    print(sharedPreferences.getStringList(AppConstants.CART_LIST));      //➡️ Debug er jonno print kortese Console e dekhte parba saved data
  }

   List<CartModel>getCartList() {                                     //➡️ Storage theke cart data read kore CartModel list banabe
     List<String>? carts;                                               //➡️ String list declare kora hoise ? mane null hoite pare

     if(sharedPreferences.containsKey(AppConstants.CART_LIST)){            //➡️ Check korche storage e cart ase naki Thakle string list ta niye asche
      carts=sharedPreferences.getStringList(AppConstants.CART_LIST);
    }
    List<CartModel> cartList = [];                                         //➡️ Final result list (CartModel objects)

    carts?.forEach((element){                                              //Line ta khub important 👇 For each saved string: 1️⃣ element = ekta JSON strin 2️⃣ jsonDecode(element) → String → Ma 3️⃣ CartModel.fromJson(map) → Map → CartModel objec 4️⃣ cartList e add So reverse process holo: 📦 JSON String → Map → CartModel Object
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartList;                                                       //➡️ Finally pura cart item list return
  }

  List<CartModel>getCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory=[];
      cartHistory=sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }

    List<CartModel> cartListHistory=[];
    for (var element in cartHistory) {
      cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    }
    return cartListHistory;
  }
  void addToCartHistoryList() {

    List<String> currentCart = [];
    List<String> currentHistory = [];

    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      currentCart = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }

    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      currentHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }

    currentHistory.addAll(currentCart);

    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, currentHistory);

    sharedPreferences.remove(AppConstants.CART_LIST);
    print("The length of history list is ${getCartHistoryList().length}");
    for(int j=0; j<getCartHistoryList().length; j++){
      print("The time for order is"+ getCartHistoryList()[j].time.toString());
    }

  }


  void removeCart(){
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

}

