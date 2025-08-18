import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';

import '../utils/dimentions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Bigtext(color: Colors.black, text:text,size: Dimentions.font26,),
        const SizedBox(height: 10,),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index)=> const Icon(Icons.star,color: Colors.teal,size: 15,)),
            ),
            const SizedBox(width:5,),
            Smalltext(color: Colors.black45, text: "4.5"),
            const SizedBox(width: 5,),
            Smalltext(color: Colors.black45, text: "1287"),
            const SizedBox(width: 5,),
            Smalltext(color: Colors.black45, text: "Comments")

          ],
        ),
        const SizedBox(height: 10,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: Colors.orange),

            IconTextWidget(
                icon: Icons.location_on,
                text: "Location",
                iconColor: Colors.tealAccent),

            IconTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: Colors.orange),
          ],
        )
      ],
    );
  }
}
