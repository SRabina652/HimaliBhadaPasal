import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../text_and_icon/text_and_icon.dart';
import '../text_widgets/main_text.dart';
import '../text_widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  String text;
  AppColumn({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainText(
          text: text,
          size: Dimensions.font23,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                    size: 15,
                  )),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "128"),
            SizedBox(
              width: 5,
            ),
            SmallText(text: "Comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextAndIcon(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),

            TextAndIcon(
                icon: Icons.location_on,
                text: "2.4",
                iconColor: AppColors.mainColor),
          ],
        )
      ],
    );
  }
}
