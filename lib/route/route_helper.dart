import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:himali_bhada_pasal/pages/home/main_utensils_page.dart';
import 'package:himali_bhada_pasal/pages/utensils/popular_utensils_body.dart';
import 'package:himali_bhada_pasal/pages/utensils/recomended_utensils_detail.dart';

class RouteHelper{
  static const String initial="/";
  static const String popularPage="/popular-page";
  static const String recommendedPage="/recommended-page";

  static String getInitials()=>"$initial";
  static String getPopularUtensils(int pageId)=>"$popularPage?pageId=$pageId";
  static String getRecommendedUtensils(int pageId)=>"$recommendedPage?pageId=$pageId";

  static List<GetPage> routes=[
    //for initial page
    GetPage(name: initial, page:(){
      return MainUtensilsPage();
  },
      transition: Transition.fadeIn,
    ),
    //route for popular page
    GetPage(name: popularPage, page:(){
      //getting the parameter received while transitioning the page
      int pageId= int.parse(Get.parameters['pageId']!);
      return  PopularUtensilsDetailsPage(pageId: pageId,);
  },
      transition: Transition.zoom,
    ),
    //Route for recommended food
    GetPage(name: recommendedPage, page:(){
      int pageId=int.parse(Get.parameters['pageId']!);
      return  RecomendedUtensilsDetails(pageId: pageId,);
    },
      transition: Transition.zoom,
    ),
  ];
}