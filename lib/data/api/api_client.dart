import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  late String appBaseUrl;
late Map<String, String> _mainHeaders;
ApiClient({required this.appBaseUrl}){
  baseUrl = appBaseUrl;
  timeout = const Duration(seconds: 30);
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