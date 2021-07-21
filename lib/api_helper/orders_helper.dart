import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:dio/dio.dart';

import 'constants.dart';

// class ProductApi{
//   ProductApi._();
//   static ProductApi api=ProductApi._();
//   Dio dio=Dio();
//
//
//   Future<List<Data>> getAllProducts() async{
//     Response response = await dio.get(baseUrl + GET_PRODUCTS_URL,);
//     // options : options);
//     Map<String,dynamic> responseBody=response.data;
//     print('productListJson${responseBody}');
//     List<dynamic> mapList = responseBody["data"];
//     List<Data> productsList = mapList.map((e) =>Data.fromJson(e)).toList();
//     print('productsList${productsList}');
//     return productsList;
//   }


// }