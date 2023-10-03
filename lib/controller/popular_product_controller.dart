import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:himali_bhada_pasal/controller/cart_controller.dart';
import 'package:himali_bhada_pasal/data/repository/popular_product_repo.dart';
import 'package:himali_bhada_pasal/utils/colors.dart';

import '../model/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList=>_popularProductList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  int _quantity=0;
  int _inCardItems=0;

  int get GetInCardItems=>_inCardItems + _quantity;
  int get quantity=>_quantity;

  late CartController _cartController;

  Future<void> getPopularProductList() async{
    Response response=await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      _isLoaded=true;
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      update();
    }else{
    }
  }
  void setQuantity(bool isIncremented){
    if(isIncremented){
     _quantity=checkQuantity(_quantity+1);
    }else{
       _quantity=checkQuantity(_quantity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if(quantity < 0 ) {
      Get.snackbar("Product count", "This is the least item count",
      backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    }else if(quantity>20){
      Get.snackbar("Product count", "You cannot add more than 20 item",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    }else{
      return quantity;
    }
  }
  void initProduct( CartController cartController){
    _quantity=0;
    _inCardItems=0;
    _cartController=cartController;
  }

  void addItem(ProductModel product){
    _cartController.addItems(product, _quantity);
  }
}