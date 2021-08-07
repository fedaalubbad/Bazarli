import 'package:bazarli/models/Categories_model/category_response.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:bazarli/models/slider_model/slider_response.dart';
import 'package:dio/dio.dart';
import 'constants.dart';
import 'dio_settings.dart';

class HomeApi {
  HomeApi._();

  static HomeApi api = HomeApi._();

  Future<List<Category>> getAllCategories() async {
    try {
      Response response = await Settings.settings.dio.get(GET_CATEGORIES_URL);
      if (response.statusCode < 400) {
        Map<String, dynamic> responseBody = response.data;
        print('categoriesListJson${responseBody}');
        List<dynamic> mapList = responseBody["categories"];
        List<Category> categoriesList = mapList.map((e) =>
            Category.fromJson(e)).toList();
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

  Future<CategoriesResponse> getAllHomeCategories() async {
    try {
      Response response = await Settings.settings.dio.get(GET_HOME_CATEGORIES_URL);
      print('categoriesListJson ${response.statusCode}');
      if (response.statusCode < 400) {
        Map<String, dynamic> responseBody = response.data;
        print('categoriesListJson${responseBody} ${response.statusCode}');
       CategoriesResponse categoriesResponse =CategoriesResponse.fromJson(responseBody);
        return categoriesResponse ;
      } else {
        print('categories'+response.data);
      }
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future<SlidersResponse> getSliders() async {
    try {
      Response response = await Settings.settings.dio.get(GET_Sliders_URL+'?locale=en&language=en');
      if (response.statusCode < 400) {
        Map<String, dynamic> responseBody = response.data;
        print('slidersListJson${responseBody}');
        SlidersResponse slidersResponse= SlidersResponse.fromJson(responseBody);
        return slidersResponse;
      } else {
        print('sliders'+response.data);
      }
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<BrandResponse> getAllBrands() async {
    try {
      Response response = await Settings.settings.dio.get(GET_BRANDS_URL);
      if (response.statusCode < 400) {
        Map<String, dynamic> responseBody = response.data;
        print('brandListJson${responseBody}');

        BrandResponse brandResponse=BrandResponse.fromJson(responseBody);
        return brandResponse;
      } else {
        print('brands'+response.data);
      }
    } on Exception catch (e) {
      print('brandserror'+e.toString());
      return null;
    }
  }
}