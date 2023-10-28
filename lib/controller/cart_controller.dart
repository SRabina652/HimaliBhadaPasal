import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:himali_bhada_pasal/model/cart_model.dart';
import 'package:himali_bhada_pasal/model/products_model.dart';

import '../data/repository/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;
  List<CartModel> storageItems=[];


  void addItems(ProductModel product, int quantity) {
    var totalQuantity=0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity=value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          time: DateTime.now().toString(),
          isExist: true,
          productModel: product
        );
      });
      if(totalQuantity<=0){
        _items.remove(product.id!);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            time: DateTime.now().toString(),
            isExist: true,
            productModel: product
          );
        });
      } else {
        Get.snackbar(
          "Product count",
          "you should atleast add one item to the cart",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  bool itemExistsInCart(ProductModel product) {
    if (_items.containsKey(product.id!)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalProducts{
    var totalItems=0;
    _items.forEach((key, value) {
      totalItems += value.quantity!;
    });
    return totalItems;
  }

  List<CartModel> get getItems{
   return _items.entries.map((e){
      return e.value;
    }).toList();
  }

  int get totalAmount{
    var total=0;
    _items.forEach((key, value) {
      total += value.price! * value.quantity!;
    });
    return total;
  }

  List<CartModel> getCartItems(){
    setCart=cartRepo.getCartList();
    return storageItems;
  }
  set setCart(List<CartModel> items){
    storageItems=items;

    for(int i=0; i< storageItems.length ;i++){
      _items.putIfAbsent(storageItems[i].productModel!.id!, () => storageItems[i]);
    }
  }

  void addToHistory(){
    cartRepo.addToCartHistory();
    clearHistory();
  }

  void clearHistory() {
    _items={};
    update();
  }

  List<CartModel> getCartHistory(){
    return cartRepo.getCartHistory();
  }

  set setItems(Map<int, CartModel> setItems){
    _items = {};
    _items=setItems;
  }

  void addToCartList(){
    cartRepo.addToCartList(getItems);
    update();
  }
}
