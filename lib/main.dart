import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_with_backend/routes/route_helper.dart';
import 'helper/dependencies.dart'as dep;


Future<void> main() async {


WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute: RouteHelper.getSplash(),
   getPages: RouteHelper.routes,
    );

  }
}
