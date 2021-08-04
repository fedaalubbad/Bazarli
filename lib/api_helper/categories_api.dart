import 'package:bazarli/models/Categories_model/categories_classes/category.dart';
import 'package:dio/dio.dart';
import 'constants.dart';
import 'dio_settings.dart';

class CategoryApi {
  CategoryApi._();

  static CategoryApi api = CategoryApi._();

  Future<List<Categories>> getAllCategories() async {
    try {
      Response response = await Settings.settings.dio.get(GET_CATEGORIES_URL);
      if (response.statusCode < 400) {
        Map<String, dynamic> responseBody = response.data;
        print('categoriesListJson${responseBody}');
        List<dynamic> mapList = responseBody["categories"];
        List<Categories> categoriesList = mapList.map((e) =>
            Categories.fromJson(e)).toList();
        print('categoriesList${categoriesList[0]}');
        return categoriesList;
      } else {
        print('categories'+response.data);
      }
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}