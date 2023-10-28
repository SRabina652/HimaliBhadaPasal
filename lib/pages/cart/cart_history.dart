import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:himali_bhada_pasal/base/no_data_page.dart';
import 'package:himali_bhada_pasal/controller/cart_controller.dart';
import 'package:himali_bhada_pasal/model/cart_model.dart';
import 'package:himali_bhada_pasal/route/route_helper.dart';
import 'package:himali_bhada_pasal/utils/app_constants.dart';
import 'package:himali_bhada_pasal/utils/dimensions.dart';
import 'package:himali_bhada_pasal/widgets/icon/app_icon.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/main_text.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/small_text.dart';
import 'package:intl/intl.dart';

import '../../utils/colors.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistory= Get.find<CartController>().getCartHistory().reversed.toList();
    Map<String, int> cartItemPerOrder=Map();


    for(int i=0;i<getCartHistory.length; i++){
      if(cartItemPerOrder.containsKey(getCartHistory[i].time)){
        cartItemPerOrder.update(getCartHistory[i].time!,(value)=>++value);
      }else{
        cartItemPerOrder.putIfAbsent(getCartHistory[i].time!,()=>1);
      }
    }


    List<int> cartItemsPerOrderToList(){
      return cartItemPerOrder.entries.map((e)=>e.value).toList();
    }
    List<String> cartOrderTimeToList(){
      return cartItemPerOrder.entries.map((e)=>e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();
    print("the items per order are "+itemsPerOrder.length.toString());

    var counter=0;

    Widget timeWidget(int index){
      DateTime parseDate=DateFormat("yy-MM-dd hh:mm:ss").parse(getCartHistory[index].time!);
      var inputDatetime = DateTime.parse(parseDate.toString());
      var outputFormat= DateFormat("yy/MM/dd hh:mm a");
      var outputDate= outputFormat.format(inputDatetime);
      return MainText(text: outputDate);
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.height20*5,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45,left: Dimensions.width10,right: Dimensions.width10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainText(text: "Card History",color: Colors.white,),
                AppIconClass(icon: Icons.shopping_cart_outlined,backgroundColor: AppColors.mainColor,iconColor: Colors.white, iconSize: 25.0,),
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController){
           return _cartController.getCartHistory().length > 0 ?Expanded(child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20
                ),
                child:MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child:  ListView(
                    children: [
                      for(int j=0;j<itemsPerOrder.length;j++)
                        Container(
                          height: Dimensions.height20*6,
                          margin: EdgeInsets.only(bottom:Dimensions.height20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              timeWidget(counter),
                              SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                      direction: Axis.horizontal,
                                      children: List.generate(itemsPerOrder[j], (index) {
                                        if(counter < getCartHistory.length){
                                          counter++;
                                        }
                                        return index <=2?Container(
                                          height: Dimensions.height20*4,
                                          width: Dimensions.height20*4,
                                          margin: EdgeInsets.only(right: Dimensions.width10/2),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius15),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  AppConstant.BASE_URL + AppConstant.UPLOAD_URI + getCartHistory[counter-1].img!,
                                                ),
                                              )
                                          ),
                                        ):Container();
                                      })
                                  ),
                                  Container(
                                    height: 80,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SmallText(text: "Total",color: AppColors.titleColor,),
                                        MainText(text: itemsPerOrder[j].toString() + " items",color: AppColors.titleColor,size: 18.0,),
                                        GestureDetector(
                                          onTap: (){
                                            var orderTime =cartOrderTimeToList();
                                            Map<int, CartModel> moreOrders={};
                                            for(int k=0;k<getCartHistory.length;k++){
                                              if(getCartHistory[k].time == orderTime[j]){
                                                moreOrders.putIfAbsent(getCartHistory[k].id!, () =>
                                                    CartModel.fromJson(jsonDecode(jsonEncode(getCartHistory[k]))));
                                              }
                                            }
                                            Get.find<CartController>().setItems=moreOrders;
                                            Get.find<CartController>().addToCartList();
                                            Get.toNamed(RouteHelper.getCartPage());
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,vertical: Dimensions.height5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                              border: Border.all(width: 1,color: AppColors.mainColor,),
                                            ),
                                            child: SmallText(text: "More Items..",),
                                          ),
                                        )

                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )

                    ],
                  ),)
            )):Container(
             height: MediaQuery.of(context).size.height/1.4,
               child: NoDataPage(text: "You haven't bought anything so far..", imagePath: "assets/logo/shopping_cart.png"));
          })
        ],
      ),
    );
  }
}
