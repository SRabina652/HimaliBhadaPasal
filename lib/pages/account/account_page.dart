import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:himali_bhada_pasal/utils/colors.dart';
import 'package:himali_bhada_pasal/widgets/account/account_widgets.dart';
import 'package:himali_bhada_pasal/widgets/icon/app_icon.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/main_text.dart';

import '../../utils/dimensions.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: MainText(
            text: "Profile Page",
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: Dimensions.height20*1.5),
        width: double.maxFinite,
        child: Column(
          children: [
            //profile
            AppIconClass(icon: Icons.person,backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45*2,
            size: Dimensions.height20*7,),
            SizedBox(height: Dimensions.height45,),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  //name
                  AccountWidgets(mainText: MainText( text: "Rabina"), appIconClass: AppIconClass(icon: Icons.person,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height20,
                    size: Dimensions.height45,)),
                  SizedBox(height: Dimensions.height20,),
                  //phone
                  AccountWidgets(mainText: MainText( text: "9084874838"),
                      appIconClass: AppIconClass(icon: Icons.phone,
                        backgroundColor: AppColors.starColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height20,
                        size: Dimensions.height45,)),
                  SizedBox(height: Dimensions.height20,),
                  //email
                  AccountWidgets(mainText: MainText( text: "shahirabina652@gmail.com"),
                      appIconClass: AppIconClass(icon: Icons.email,
                        backgroundColor: AppColors.signColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height20,
                        size: Dimensions.height45,)),
                  SizedBox(height: Dimensions.height20,),
                  //address
                  AccountWidgets(mainText: MainText( text: "Jajarkot, khalanga"),
                      appIconClass: AppIconClass(icon: Icons.location_on,
                        backgroundColor: AppColors.iconColor2,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height20,
                        size: Dimensions.height45,)),
                  SizedBox(height: Dimensions.height20,),
                  //messages
                  AccountWidgets(mainText: MainText( text: "Hi there"),
                      appIconClass: AppIconClass(icon: Icons.message_outlined,
                        backgroundColor: AppColors.iconColor1,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height20,
                        size: Dimensions.height45,)),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
