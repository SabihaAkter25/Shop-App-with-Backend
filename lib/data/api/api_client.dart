import 'package:get/get.dart';
import 'package:shop_app_with_backend/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  late String appBaseUrl;
late Map<String, String> _mainHeaders;
ApiClient({required this.appBaseUrl, required this.token}){
  baseUrl = appBaseUrl;
  timeout = const Duration(seconds: 30);
  token =AppConstant.TOKEN;
  _mainHeaders={
'content_type': 'application/json; charset=UTF-8',
    'Authorization':'Bearer $token',
  };
}
Future<Response>getData(String uri) async {
  try{
Response response=await get(uri);
return response;
  }catch(e){
    return Response(statusCode: 1, statusText: e.toString());
  }
 }
}

