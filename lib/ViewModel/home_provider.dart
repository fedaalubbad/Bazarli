import 'package:bazarli/api_helper/home_api.dart';
import 'package:bazarli/models/Categories_model/category_response.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:bazarli/models/slider_model/slider_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeProvider extends ChangeNotifier {
  TabController tabController;
  ScrollController scrollController = new ScrollController();
  List<Datum> categoriesList = [];
  List<Brand> brandList=[];
  List<Sliderdatum> sliderList=[];
  double currentIndex=0;
  SlidersResponse slidersResponse;
  BrandResponse brandResponse;
  CategoryResponse categoriesResponse;
  // setIndex(){
  //
  // }
  int getInitialIndex(context) {
    int initialIndex = PageStorage.of(context).readState(context) ?? 0;
    notifyListeners();
    print("Initial Index ${initialIndex}");
    return initialIndex;
  }

  toBack(){
    scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 5000),
      curve: Curves.fastOutSlowIn,
    );
    notifyListeners();
  }

  toNext(){
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 5000),
      curve: Curves.fastOutSlowIn,
    );
    notifyListeners();
  }

  Future<CategoryResponse> getAllCategories(context) async {
    CategoryResponse response= await HomeApi.api.getAllCategories(context);
    this.categoriesList = response.data;
   categoriesResponse=response;
    notifyListeners();
    return categoriesResponse;
  }

  Future<BrandResponse> getAllBrandss(context) async {
    BrandResponse response = await HomeApi.api.getAllBrands(context);
    this.brandList = response.brands;
    brandResponse=response;
    notifyListeners();
    return brandResponse;
  }
  Future<SlidersResponse> getSliders(context) async {
   SlidersResponse response = await HomeApi.api.getSliders(context);
    this.sliderList= response.sliderdata;
    slidersResponse= response;
    notifyListeners();
    return slidersResponse;
  }

}
