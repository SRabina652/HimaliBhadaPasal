import 'package:get/get.dart';
import 'package:himali_bhada_pasal/controller/cart_controller.dart';
import 'package:himali_bhada_pasal/controller/popular_product_controller.dart';
import 'package:himali_bhada_pasal/data/api/api_client.dart';
import 'package:himali_bhada_pasal/data/repository/cart_repo.dart';
import 'package:himali_bhada_pasal/data/repository/popular_product_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async{

  final sharedPreferences= await SharedPreferences.getInstance();

  Get.lazyPut(()=>sharedPreferences);
  //Api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstant.BASE_URL));

  // Repos
  //for popular product repository
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>CartRepo(sharedPreferences:Get.find()));

  //Controller
  //popular controller
  Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
  //Recommended Controller
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo:Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}