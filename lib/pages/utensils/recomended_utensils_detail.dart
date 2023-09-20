import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:himali_bhada_pasal/controller/recommended_product_controller.dart';
import 'package:himali_bhada_pasal/route/route_helper.dart';
import 'package:himali_bhada_pasal/utils/app_constants.dart';
import 'package:himali_bhada_pasal/utils/colors.dart';
import 'package:himali_bhada_pasal/widgets/icon/app_icon.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/expandable_text_height.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/main_text.dart';

import '../../utils/dimensions.dart';

class RecomendedUtensilsDetails extends StatelessWidget {
  int pageId;
  RecomendedUtensilsDetails({super.key,required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product= Get.find<RecommendedProductController>().recommendedProductList[pageId];
    // print("pageId: "+ pageId.toString());
    // print("The product Description is: "+product.description);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:(){
                    Get.toNamed(RouteHelper.getInitials());
      },
                  child: AppIconClass(
                    icon: Icons.clear,
                    backgroundColor: Colors.white,
                  ),
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
                    text: product.name.toString(),
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
              background: Image.network(
               AppConstant.BASE_URL + AppConstant.UPLOAD_URI + product.img!,
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
                        product.description!),
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
                  MainText(text: "\$ ${product.price} "+ " x " + " 3 "),
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
