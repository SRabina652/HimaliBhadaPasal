import 'package:get/get.dart';
import 'package:himali_bhada_pasal/data/repository/popular_product_repo.dart';

import '../model/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList=>_popularProductList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  Future<void> getPopularProductList() async{
    Response response=await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      _isLoaded=true;
      print("got products");
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      update();
    }else{
    }
  }
}