import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:himali_bhada_pasal/model/cart_model.dart';
import 'package:himali_bhada_pasal/model/products_model.dart';

import '../data/repository/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  void addItems(ProductModel product, int quantity) {
    _items.putIfAbsent(product.id!, () {
      print("product id: "+ product.id!.toString() + " product Name: "+product.name! +" quantity: "+quantity.toString());
      return CartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        quantity: quantity,
        time: DateTime.now().toString(),
        isExist: true,
      );
    });
  }
}
