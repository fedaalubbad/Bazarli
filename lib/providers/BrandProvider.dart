import 'package:bazarli/api_helper/brand_api.dart';
import 'package:bazarli/models/brand_model/brand_classes/brand.dart';
import 'package:flutter/cupertino.dart';

class BrandProvider extends ChangeNotifier{
  List<Brands> brandList;

  Future<List<Brands>> getAllBrandss() async {
    List<Brands> users = await BrandApi.api.getAllBrands();
    this.brandList = users;
    notifyListeners();
  }
}