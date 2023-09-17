import 'package:get/get.dart';
import 'package:himali_bhada_pasal/controller/popular_product_controller.dart';
import 'package:himali_bhada_pasal/data/api/api_client.dart';
import 'package:himali_bhada_pasal/data/repository/popular_product_repo.dart';

Future<void> init() async{
  //Api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: "https://www.dbestech.com"));

  // Repos
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
  //popular controller
  Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
}