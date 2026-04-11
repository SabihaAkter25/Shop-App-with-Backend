import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/utils/dimentions.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataPage({super.key,
    required this.text,
    this.imgPath="assets/images/emptycart.webp"});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
            imgPath,
        height: MediaQuery.of(context).size.height*0.5,
          width: MediaQuery.of(context).size.width*0.5,
        ),
        SizedBox(height: Dimentions.height10*0.9,),
        Text(text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height*0.0175,
          color:Theme.of(context).disabledColor
        ),
        textAlign: TextAlign.center,),
      ],
    );
  }
}
