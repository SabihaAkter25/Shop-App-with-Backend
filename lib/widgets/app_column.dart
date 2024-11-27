import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';

import '../utils/dimantions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text:text,size: Dimantions.font26,),
        SizedBox(height: Dimantions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) => Icon(
                  Icons.star,
                  color: Colors.teal.shade200,
                ),
              ),
            ),
            SizedBox(width: Dimantions.width10),
            SmallText(text: "4.5"),
            SizedBox(width: Dimantions.width10),
            SmallText(text: "1287"),
            SizedBox(width: Dimantions.width10),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(height: Dimantions.height10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
              icon: Icons.circle_rounded,
              text: "Normal",
              iconColor: Colors.amberAccent,
            ),
            IconAndText(
              icon: Icons.location_on_sharp,
              text: "1.7Km",
              iconColor: Colors.cyan,
            ),
            IconAndText(
              icon: Icons.access_time,
              text: "32 min",
              iconColor: Colors.redAccent,
            ),
          ],
        ),
      ],
    );
  }
}
