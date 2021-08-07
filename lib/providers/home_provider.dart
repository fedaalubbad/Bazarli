import 'package:bazarli/api_helper/home_api.dart';
import 'package:bazarli/models/Categories_model/category_response.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:bazarli/models/slider_model/slider_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
class HomeProvider extends ChangeNotifier {
  List<Category> categoriesList = [];
  List<Brand> brandList=[];
  List<Sliderdatum> sliderList=[];
  double currentIndex=0;


  setIndex(){

  }
  Future<List<Category>> getAllCategories() async {
   CategoriesResponse categories = await HomeApi.api.getAllHomeCategories();
    this.categoriesList = categories.categories;
    notifyListeners();
    return categoriesList;
  }

  Future<List<Brand>> getAllBrandss() async {
    BrandResponse brandResponse = await HomeApi.api.getAllBrands();
    this.brandList = brandResponse.brands;
    notifyListeners();
    return brandList;
  }
  Future<List<Sliderdatum>> getSliders(BuildContext context) async {
   SlidersResponse sliderResponse = await HomeApi.api.getSliders();
    this.sliderList= sliderResponse.sliderdata;
    notifyListeners();
    return sliderList;
  }

}
