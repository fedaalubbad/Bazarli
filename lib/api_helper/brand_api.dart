import 'package:bazarli/models/brand_model/brand_classes/brand.dart';
import 'package:dio/dio.dart';

import 'constants.dart';

class BrandApi {
  BrandApi._();

  static BrandApi api = BrandApi._();
  Dio dio = Dio();


  Future<List<Brands>> getAllBrands() async {
    Response response = await dio.get(baseUrl + brands,);
    // options : options);
    Map<String, dynamic> responseBody = response.data;
    print('brandListJson${responseBody}');
    List<dynamic> mapList = responseBody["data"];
    List<Brands> brandList = mapList.map((e) => Brands.fromJson(e)).toList();
    print('brandsList${brandList[0]}');
    return brandList;
  }

}