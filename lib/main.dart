import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:himali_bhada_pasal/controller/popular_product_controller.dart';
import 'package:himali_bhada_pasal/controller/recommended_product_controller.dart';
import 'package:himali_bhada_pasal/pages/cart/cart_page.dart';
import 'package:himali_bhada_pasal/pages/home/main_utensils_page.dart';
import 'package:himali_bhada_pasal/pages/home/utensils_page_body.dart';
import 'package:himali_bhada_pasal/pages/utensils/popular_utensils_body.dart';
import 'package:himali_bhada_pasal/pages/utensils/recomended_utensils_detail.dart';
import 'package:himali_bhada_pasal/route/route_helper.dart';
import 'helper/dependencies.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // home: const PopularUtensilsDetailsPage(),
      // home: const MainUtensilsPage(),
      initialRoute: RouteHelper.getInitials(),
      getPages: RouteHelper.routes,

      // home: CartPage(),
      // home: const RecomendedUtensilsDetails(),


    );
  }
}
