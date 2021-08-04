import 'package:bazarli/api_helper/brand_api.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:flutter/cupertino.dart';

class BrandProvider extends ChangeNotifier{
  List<Brand> brandList=[];

  Future<List<Brand>> getAllBrandss() async {
    BrandResponse brandResponse = await BrandApi.api.getAllBrands();
    this.brandList = brandResponse.brands;
    notifyListeners();
    return brandList;
  }
}