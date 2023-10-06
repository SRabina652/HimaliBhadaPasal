import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:himali_bhada_pasal/controller/cart_controller.dart';
import 'package:himali_bhada_pasal/controller/popular_product_controller.dart';
import 'package:himali_bhada_pasal/pages/home/main_utensils_page.dart';
import 'package:himali_bhada_pasal/route/route_helper.dart';
import 'package:himali_bhada_pasal/utils/app_constants.dart';
import 'package:himali_bhada_pasal/widgets/icon/app_icon.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/main_text.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/small_text.dart';

import '../../controller/recommended_product_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIconClass(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24 / 1.3,
                  ),
                  SizedBox(
                    width: Dimensions.width30 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitials());
                    },
                    child: AppIconClass(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24 / 1.2,
                    ),
                  ),
                  AppIconClass(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24 / 1.4,
                  ),
                ],
              )),
          Positioned(
              top: Dimensions.height30 * 3.5,
              left: Dimensions.height20,
              right: Dimensions.height20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height20),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 5,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(
                                                _cartList[index].productModel!);
                                    if (popularIndex >= 0) {
                                      Get.toNamed(
                                          RouteHelper.getPopularUtensils(
                                              popularIndex, "cartPage"));
                                    } else {
                                      var recommendedIndex = Get.find<
                                              RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(
                                              _cartList[index].productModel!);
                                      Get.toNamed(
                                          RouteHelper.getRecommendedUtensils(
                                              recommendedIndex, "cartPage"));
                                    }
                                  },
                                  child: Container(
                                    width: Dimensions.height20 * 5,
                                    height: Dimensions.height20 * 5,
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.height10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            AppConstant.BASE_URL +
                                                AppConstant.UPLOAD_URI +
                                                cartController
                                                    .getItems[index].img!),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width20,
                                ),
                                Expanded(
                                    child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MainText(
                                          text: cartController
                                              .getItems[index].name!),
                                      SmallText(text: "Silver"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MainText(
                                            text: "\$ " +
                                                cartController
                                                    .getItems[index].price!
                                                    .toString(),
                                            color: Colors.greenAccent,
                                            size: 18.0,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(
                                                Dimensions.width10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItems(
                                                        _cartList[index]
                                                            .productModel!,
                                                        -1);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width10,
                                                ),
                                                MainText(
                                                    text: _cartList[index]
                                                        .quantity
                                                        .toString()),
                                                // popularProduct.GetInCardItems.toString()),
                                                SizedBox(
                                                  width: Dimensions.width10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItems(
                                                        _cartList[index]
                                                            .productModel!,
                                                        1);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          );
                        });
                  }),
                ),
              )),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartProduct) {
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
                      SizedBox(width: Dimensions.width15,),
                      MainText(text: "Total:  \$ "+ cartProduct.totalAmount.toString(),),
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
                    text: "\$ | add to cart",
                    color: Colors.white,
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
