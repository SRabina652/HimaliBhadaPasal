import 'package:get/get.dart';
import 'package:himali_bhada_pasal/data/api/api_client.dart';
import 'package:himali_bhada_pasal/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstant.RECOMMENDED_PRODUCT_URI);
  }
}