import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;

  ApiClient({required this.appBaseUrl, required String token}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);

    // 🔥 THIS LINE FIXES EVERYTHING
    httpClient.defaultDecoder = (map) {
      return map;
    };

    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Content-Type'] = 'application/json; charset=UTF-8';
      request.headers['Authorization'] = 'Bearer ${AppConstants.TOKEN}';
      return request;
    });
  }

  Future<Response> getData(String uri) async {
    try {
      final response = await get(uri);
      print("BODY STRING 👉 ${response.bodyString}");
      print("BODY 👉 ${response.body}");
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
