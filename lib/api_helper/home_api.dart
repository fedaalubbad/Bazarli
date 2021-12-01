import 'package:bazarli/models/cart_model/HomeCategoriesResponse.dart';
import 'package:bazarli/models/Categories_model/category_response.dart';
import 'package:bazarli/models/arrivals_response/arrivals_response.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:bazarli/models/slider_model/slider_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants_urls.dart';
import 'dio_settings.dart';

class HomeApi {
  HomeApi._();

  static HomeApi api = HomeApi._();

  Future<CategoryResponse> getAllCategories(context) async {
    try {
      Response response = await Settings.settings.dio.get(GET_CATEGORIES_URL);
      if (response.statusCode < 400) {
        CategoryResponse getCategoriesResponse = CategoryResponse.fromJson(response.data);
        return getCategoriesResponse;
      } else {
        print(response.data);
        // _showToast(context,response.statusMessage);
      }
    } on Exception catch (e) {
      // _showToast(context,'getAllCategoriesfailed'+e.toString());

      return null;
    }
  }

  Future<CategoryResponse> getCategoriesInfo(context,{local}) async {
    try {
      if(local==null)
      local='en';

      Response response = await Settings.settings.dio.get(GET_CATEGORIESINFO_URL+'?token=true&locale=$local');
      if (response.statusCode < 400) {
        CategoryResponse getCategoriesResponse = CategoryResponse.fromJson(response.data);
        return getCategoriesResponse;
      } else {
        print(response.data);
        // _showToast(context,response.statusMessage);
      }
    } on Exception catch (e) {
      // _showToast(context,'getAllCategoriesfailed'+e.toString());

      return null;
    }
  }

  Future<HomeCategoriesResponse> getAllHomeCategories(context,lang) async {
    try {
      Response response = await Settings.settings.dio.get(GET_HOME_CATEGORIES_URL+'?locale=$lang');
      if (response.statusCode < 400) {
        HomeCategoriesResponse getCategoriesResponse =
        HomeCategoriesResponse.fromJson(response.data);
        return getCategoriesResponse;
      } else {
        // _showToast(context,response.statusMessage);
        print(response.data);
      }
    } on Exception catch (e) {
      // _showToast(context,'getAllCategoriesfailed'+e.toString());
      return null;
    }
  }
  Future<SlidersResponse> getSliders(context) async {
    try {
      Response response = await Settings.settings.dio.get(GET_Sliders_URL+'?locale=en&language=en');
      if (response.statusCode < 400) {
        Map<String, dynamic> responseBody = response.data;
        print('slidersListJson${responseBody}');
        SlidersResponse slidersResponse= SlidersResponse.fromJson(responseBody);
        return slidersResponse;
      } else {
        // _showToast(context,response.statusMessage);
        print('sliders'+response.data);
      }
    } on Exception catch (e) {
      // _showToast(context,'getSlidersfailed'+e.toString());
      print(e.toString());
      return null;
    }
  }



  Future<BrandResponse> getAllBrands(context) async {
    try {
      Response response = await Settings.settings.dio.get(GET_BRANDS_URL);
      if (response.statusCode < 400) {
        Map<String, dynamic> responseBody = response.data;
        print('brandListJson${responseBody}');

        BrandResponse brandResponse=BrandResponse.fromJson(responseBody);
        return brandResponse;
      } else {
        // _showToast(context,response.statusMessage);
        print('brands'+response.data);
      }
    } on Exception catch (e) {
      // _showToast(context,'getAllBrandsfailed'+e.toString());
      print('brandserror'+e.toString());
      return null;
    }
  }
  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        // action: SnackBarAction(label: 'Done', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}