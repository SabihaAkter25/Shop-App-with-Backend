import 'package:get/get_connect/connect.dart';                             //এটা GetConnect ক্লাস আনে, যা দিয়ে HTTP রিকোয়েস্ট করা যায়।
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../utils/app_constants.dart';  // এটা GetxService ক্লাস আনে, যা GetX-এর সার্ভিস হিসেবে ব্যবহার হয় এবং অ্যাপ চালু থাকা পর্যন্ত জীবিত (alive) থাকে।

class ApiClient extends GetConnect implements GetxService{
  //এখানে ApiClient নামে একটা ক্লাস বানানো হয়েছে,
  // যেটা GetConnect থেকে সব HTTP ফাংশনগুলো ইনহেরিট করেছে (যেমন: get(), post() ইত্যাদি)।
  //  আর implements GetxService মানে এটা GetX সার্ভিস হিসেবেও কাজ করবে।

  late String token;                                          //তোমার Authorization টোকেন (Bearer Token) রাখবে, যেটা API এর সাথে নিরাপদে যোগাযোগের জন্য দরকার।

  final String appBaseUrl;                                // API এর মূল URL (যেমন: https://example.com/api)। Constructor থেকে পাঠানো হবে।

  late Map<String,String>_mainHeader;                   //_mainHeader: Header data store korbe — ja prottek API call e lagbe.

  ApiClient({required this.appBaseUrl, this.token=''} ){              //this.appBaseUrl: constructor parameter dhore baseUrl set kora hochche.
    baseUrl = appBaseUrl;
    token =AppConstants.TOKEN;
    timeout = Duration(seconds:30);                        //timeout: 30 second porjonto API response na pele timeout dibe

    _mainHeader=  {                                            //_mainHeader: ekta map create kora hocche:
      //   Content-type: json data pathacchi.
      //  Authorization: user-er token add kore authorization header set hocche. (Kintu ekhane ekta bug ache, eta pore bolbo.)
      'Content-type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }                                                        //async:ফাংশনের ভিতরের কোড asynchronous, মানে এটা অন্য কাজের সাথে পাল্লা দিয়ে চলবে। এর ভিতরে আমরা await ব্যবহার করতে পারি, যেটা async ফাংশন থেকে result না আসা পর্যন্ত অপেক্ষা করে।

  Future<Response> getData(String uri)async{               //Future<Response>:
    //এই ফাংশন ভবিষ্যতে (async) Response টাইপের একটা ডেটা ফিরিয়ে দেবে।Response হচ্ছে GetX-এর get() মেথড থেকে পাওয়া HTTP রেসপন্স অবজেক্ট।
    try{
      //try-catch Block:  এটি ব্যবহার করা হয় error handle করার জন্য, যেন কোনো exception (ভুল) হলে অ্যাপ ক্র্যাশ না করে সুন্দরভাবে একটি রেসপন্স দেয়।
      Response response = await get(uri,headers: _mainHeader);                 //get(uri): এটা GetX-এর GetConnect থেকে আসে।  এটা uri এ থাকা ঠিকানা অনুযায়ী HTTP GET রিকোয়েস্ট পাঠায়।
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());     //statusCode: 1 মানে:"এই রেসপন্স কোনো HTTP সার্ভার থেকে আসেনি। এটা কোডে exception ধরা পড়ার ফল।"
    }
  }
}