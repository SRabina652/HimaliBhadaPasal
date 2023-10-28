import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/cart_model.dart';
import '../../utils/app_constants.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart=[];
  List<String> cartHistory=[];
  void addToCartList(List<CartModel> cartList){
    // sharedPreferences.remove(AppConstant.Cart_history_List);
    // sharedPreferences.remove(AppConstant.Cart_List);
    // return;

    cart=[];
    var time=DateTime.now().toString();
    // cartList.forEach((element) {
    //   return cart.add(jsonEncode(element));
    // });

    // Converting objects to string because sharedPreferences only accept string
    cartList.forEach((element){
      element.time=time;
     return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstant.Cart_List, cart);
    
    // print(sharedPreferences.getStringList(AppConstant.Cart_List));
    getCartList();
  }

  List<CartModel> getCartList(){
    List<String> carts=[];

    if(sharedPreferences.containsKey(AppConstant.Cart_List)){
      carts = sharedPreferences.getStringList(AppConstant.Cart_List)!;
      print("this is from getCartList Method: "+ carts.toString());
    }
    List<CartModel> cartModelList=[];
    carts.forEach((element)=> cartModelList.add(CartModel.fromJson(jsonDecode(element))));

    return cartModelList;
  }

  List<CartModel> getCartHistory(){
    if(sharedPreferences.containsKey(AppConstant.Cart_history_List)){
      // cartHistory=[];
      cartHistory=sharedPreferences.getStringList(AppConstant.Cart_history_List)!;
    }
    List<CartModel> cartListHistory=[];
    cartHistory.forEach((element)=>cartListHistory.add(CartModel.fromJson(jsonDecode(element))));

    return cartListHistory;
  }
  void addToCartHistory(){

    if(sharedPreferences.containsKey(AppConstant.Cart_history_List)){
      cartHistory=sharedPreferences.getStringList(AppConstant.Cart_history_List)!;
    }

    for(int i=0;i<cart.length;i++){
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstant.Cart_history_List, cartHistory);
    print("The length of the cart items is: "+ getCartHistory().length.toString());
  }

  void removeCart() {
    cart=[];
    sharedPreferences.remove(AppConstant.Cart_List);
  }

}