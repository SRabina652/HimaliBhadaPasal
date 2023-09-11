import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himali_bhada_pasal/utils/dimensions.dart';
import 'package:himali_bhada_pasal/widgets/column/app_column.dart';

import '../../utils/colors.dart';
import '../../widgets/icon/app_icon.dart';
import '../../widgets/text_and_icon/text_and_icon.dart';
import '../../widgets/text_widgets/expandable_text_height.dart';
import '../../widgets/text_widgets/main_text.dart';
import '../../widgets/text_widgets/small_text.dart';

class PopularUtensilsDetailsPage extends StatelessWidget {
  const PopularUtensilsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularImageHeight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/image/eight.jpg",
                        ))),
              )),
          Positioned(
              top: Dimensions.height45,
              right: Dimensions.height15,
              left: Dimensions.height15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIconClass(icon: Icons.arrow_back),
                  AppIconClass(icon: Icons.shopping_cart_outlined),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularImageHeight - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: "Spoons And Other Utensils",
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    MainText(text: "Product Description"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Expanded(child: SingleChildScrollView(
                      child: ExpandableText(
                        text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                            " sed do eiusmod tempor incididunt ut labore et dolore magna "
                            "aliqua. Ut enim ad minim veniam, quis nostrud exercitation "
                            "ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute"
                            " irure dolor in reprehenderit in voluptate velit esse cillum "
                            "dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat"
                            " non proident, sunt in culpa qui officia deserunt mollit anim id "
                            "est laborum."
                        ,
                      ),
                    ),)
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeight,
        padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: Dimensions.height10 / 2,
            top: Dimensions.height10 / 2),
        decoration: BoxDecoration(
            // color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius20 * 2),
          topRight: Radius.circular(Dimensions.radius20 * 2),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  MainText(text: "0"),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10 / 2,
                  top: Dimensions.height10 / 2),
              child: MainText(
                text: "\$10 | add to cart",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
