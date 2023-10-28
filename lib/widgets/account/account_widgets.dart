import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himali_bhada_pasal/widgets/icon/app_icon.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/main_text.dart';

import '../../utils/dimensions.dart';

class AccountWidgets extends StatelessWidget {
  AppIconClass appIconClass;
  MainText mainText;
  AccountWidgets({super.key,required this.mainText,required this.appIconClass});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.height10,left: Dimensions.width20,bottom: Dimensions.height10),
      child: Row(
        children: [
          appIconClass,
          SizedBox(width: Dimensions.width20,),
          mainText
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0,2),
            color: Colors.grey.withOpacity(0.2),
          )
        ]
      ),
    );
  }
}
