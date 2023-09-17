import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:himali_bhada_pasal/utils/colors.dart';
import 'package:himali_bhada_pasal/widgets/icon/app_icon.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/expandable_text_height.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/main_text.dart';

import '../../utils/dimensions.dart';

class RecomendedUtensilsDetails extends StatelessWidget {
  const RecomendedUtensilsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIconClass(
                  icon: Icons.clear,
                  backgroundColor: Colors.white,
                ),
                AppIconClass(
                  icon: Icons.shopping_cart_outlined,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(
                      child: MainText(
                    text: "Spoons And Other Utensils",
                    size: Dimensions.font23,
                  )),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                      top: Dimensions.width10 / 2, bottom: Dimensions.width10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20),
                      )),
                )),
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/five.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                child: ExpandableText(
                    text:
                        "Silver plating is a simple process of coating materials with silver, which is also known as electrolysis However, despite its easy-to-understand nature, there are a lot of other essential details you should know about silver plating. You need to understand how the process works, it’s benefits, and where it’s best used, so you’ll know how beneficial this widely used process of plating is for your business. The Definition of Silver PlatingSilver plating is a process in which other base metals are coated with a layer of silver. The process sounds simple, but it still needs to ensure that the base metal has an even layer of silver to gain that widely known and craved matte-white look."
                        "When the process is performed over nickel silver, the result is usually called electroplated nickel silver."
                        "Besides nickel silver, the process is commonly used on copper, steel, titanium, graphite, ceramic, plastic, and aluminum.The Benefits of Silver Plating"
                        "Silver plating provides several benefits. Due to the strength of silver, this type of coating offers excellent corrosion resistance to the base material and the product as a whole."
                        "Furthermore, silver plating provides great solderability for small parts like kitchen utensils, but it also offers little electrical resistance making it perfect for all products that require an excellent finish and conductivity. A silver finish is also good for the lubricity of the product. Unfortunately, products with a silver finish can still tarnish, but due to the reasonably low price, silver plating is a cheaper alternative to gold plating, which offers similar results."
                        "All in all, silver coating is thus used for products that require:"
                        "Depending on the type of usage of the coated material, the silver coating has a different level of thickness."
                        "Electronics – bearings, semiconductors, connectors Power generators – like battery and solar"),
                margin: EdgeInsets.only(
                    right: Dimensions.width10, left: Dimensions.width15),
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height15),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20),
              topRight: Radius.circular(Dimensions.radius20),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppIconClass(
                    icon: Icons.remove,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                  ),
                  MainText(text: "\$25.44 "+ " x " + " 3 "),
                  AppIconClass(
                    icon: Icons.add,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                  )
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeight,
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10 / 2,
                  top: Dimensions.height20),
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
                    padding: EdgeInsets.all(Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: Colors.redAccent,
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
          ],
        ),
      ),
    );
  }
}
