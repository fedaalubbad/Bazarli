import 'package:bazarli/models/Categories_model/categories_classes/category.dart';
import 'package:dio/dio.dart';
import 'constants.dart';

class CategoryApi {
  CategoryApi._();

  static CategoryApi api = CategoryApi._();
  Dio dio = Dio();


  Future<List<Categories>> getAllCategories() async {
    Response response = await dio.get(baseUrl + categories,);
    // options : options);
    Map<String, dynamic> responseBody = response.data;
    print('categoriesListJson${responseBody}');
    List<dynamic> mapList = responseBody["categories"];
    List<Categories> categoriesList = mapList.map((e) => Categories.fromJson(e)).toList();
    print('categoriesList${categoriesList[0]}');
    return categoriesList;
  }

}