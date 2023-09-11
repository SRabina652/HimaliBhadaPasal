import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himali_bhada_pasal/pages/home/utensils_page_body.dart';
import 'package:himali_bhada_pasal/utils/colors.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/main_text.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/small_text.dart';

import '../../utils/dimensions.dart';

class MainUtensilsPage extends StatefulWidget {
  const MainUtensilsPage({super.key});

  @override
  State<MainUtensilsPage> createState() => _MainUtensilsPageState();
}

class _MainUtensilsPageState extends State<MainUtensilsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width15,right:Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText(text: "Nepal",color: AppColors.mainColor,),
                      Row(
                          children: [
                        SmallText(text: "Jajarkot",
                          color: Colors.black,),
                        Icon(Icons.arrow_drop_down_rounded,)

                      ]),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search, color: Colors.white,size: Dimensions.iconSize24,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child:UtensilsPageBody()
              ,
          ))
        ],
      ),
    );
  }
}
