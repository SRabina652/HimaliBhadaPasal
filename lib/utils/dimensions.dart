import 'package:get/get.dart';
class Dimensions{
  static double screenHeight= Get.context!.height;
  static double screenWidth=Get.context!.width;

  static double pageView=screenHeight/2.64;
  static double pageViewContainer= screenHeight/3.84;
  static double pageViewTextContainer=screenHeight/7.03;

// dinamic height for padding and margin
  static double height5=screenHeight/168.8;
  static double height10=screenHeight/84.4;
  static double height15=screenHeight/56.27;
  static double height20=screenHeight/42.2;
  static double height30=screenHeight/28.13;
  static double height45=screenHeight/18.46;

  // dinamic width for padding and margin
  static double width10=screenHeight/84.4;
  static double width15=screenHeight/56.27;
  static double width20=screenHeight/42.2;
  static double width30=screenHeight/28.13;
  static double width45=screenHeight/18.46;

  //font size
  static double font20=screenHeight/42.2;
  static double font23=screenHeight/36.69;


  //dinamic radius for items
  static double radius20=screenHeight/42.2;
  static double radius15=screenHeight/56.27;
  static double radius30=screenHeight/28.13;

  //dinamic icon size
  static double iconSize24=screenHeight/35.17;
  static double iconSize16=screenHeight/46.88;


  //list view image size
  static double listViewImageHeight= screenWidth/3.25;
  static double listViewImageWidth= screenWidth/3.10;

  static double listViewContainerSize=screenWidth/3.9;

  //popular item screen sizes
  static double popularImageHeight=screenHeight/2.41;

  //bottom height
  static double bottomHeight=screenHeight/10.03;

}