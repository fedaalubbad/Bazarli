import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_helper/product_api.dart';

class ProductProvider extends ChangeNotifier{
    List<Data> productList=[];

  Future<List<Data>> getAllProducts() async {
    List<Data> products = await ProductApi.api.getAllProducts();
    this.productList = products;
    notifyListeners();
    return productList;
  }

}
