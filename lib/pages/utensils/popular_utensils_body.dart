import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:himali_bhada_pasal/controller/popular_product_controller.dart';
import 'package:himali_bhada_pasal/route/route_helper.dart';
import 'package:himali_bhada_pasal/utils/app_constants.dart';
import 'package:himali_bhada_pasal/utils/dimensions.dart';
import 'package:himali_bhada_pasal/widgets/column/app_column.dart';

import '../../utils/colors.dart';
import '../../widgets/icon/app_icon.dart';
import '../../widgets/text_and_icon/text_and_icon.dart';
import '../../widgets/text_widgets/expandable_text_height.dart';
import '../../widgets/text_widgets/main_text.dart';
import '../../widgets/text_widgets/small_text.dart';
import '../home/main_utensils_page.dart';

class PopularUtensilsDetailsPage extends StatelessWidget {
  int pageId;
  PopularUtensilsDetailsPage({super.key,required this.pageId});

  @override
  Widget build(BuildContext context) {

    var product= Get.find<PopularProductController>().popularProductList[pageId];
    // print("the product id is: "+pageId.toString());
    // print("the product name is: "+product.name.toString());

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
                        image: NetworkImage(
                          AppConstant.BASE_URL+AppConstant.UPLOAD_URI + product.img!,
                        ))),
              )),
          Positioned(
              top: Dimensions.height45,
              right: Dimensions.height15,
              left: Dimensions.height15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.initial);
                      },
                      child: AppIconClass(icon: Icons.arrow_back)),
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
                      text: product.name.toString(),
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    MainText(text: "Product Description"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(
                          text:
                          product.description.toString(),
                        ),
                      ),
                    )
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
                text: "\$ ${product.price} | add to cart",
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
