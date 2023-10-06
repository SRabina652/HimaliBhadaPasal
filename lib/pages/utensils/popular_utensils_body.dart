import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:himali_bhada_pasal/controller/cart_controller.dart';
import 'package:himali_bhada_pasal/controller/popular_product_controller.dart';
import 'package:himali_bhada_pasal/pages/cart/cart_page.dart';
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
  final String page;
  PopularUtensilsDetailsPage({super.key, required this.pageId,required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

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
                          AppConstant.BASE_URL +
                              AppConstant.UPLOAD_URI +
                              product.img!,
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
                        if(page=="cartPage"){
                          Get.toNamed(RouteHelper.getCartPage());
                        }else{
                          Get.toNamed(RouteHelper.getInitials());
                        }
                      },
                      child: AppIconClass(icon: Icons.arrow_back)),
                  GetBuilder<PopularProductController>(
                    builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          if (controller.TotalItems >= 1)
                            Get.toNamed(RouteHelper.getCartPage());
                        },
                        child: Stack(
                          children: [
                            AppIconClass(icon: Icons.shopping_cart_outlined),
                            controller.TotalItems >= 1
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: AppIconClass(
                                      icon: Icons.circle,
                                      size: 20,
                                      iconColor: Colors.transparent,
                                      backgroundColor: AppColors.mainColor,
                                    ),
                                  )
                                : Container(),
                            Get.find<PopularProductController>().TotalItems >= 1
                                ? Positioned(
                                    right: 5,
                                    top: 3,
                                    child: MainText(
                                      text: Get.find<PopularProductController>()
                                          .TotalItems
                                          .toString(),
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    },
                  )
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
                          text: product.description.toString(),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
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
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      MainText(text: popularProduct.GetInCardItems.toString()),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
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
                  child: GestureDetector(
                    onTap: () {
                      popularProduct.addItem(product);
                    },
                    child: MainText(
                      text: "\$ ${product.price} | add to cart",
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
