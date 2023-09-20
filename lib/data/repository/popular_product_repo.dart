import 'package:get/get.dart';
import 'package:himali_bhada_pasal/data/api/api_client.dart';
import 'package:himali_bhada_pasal/utils/app_constants.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstant.POPULAR_PRODUCT_URI);
  }
}