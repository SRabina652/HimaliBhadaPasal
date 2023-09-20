import 'package:get/get.dart';
import 'package:himali_bhada_pasal/data/repository/popular_product_repo.dart';

import '../data/repository/recommended_product_repo.dart';
import '../model/products_model.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList=[];
  List<dynamic> get recommendedProductList=>_recommendedProductList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  Future<void> getRecommendedProductList() async{
    Response response=await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      _isLoaded=true;
      print("got recommended products");
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      update();
    }else{
      print("didnot get recommended Products");
    }
  }
}