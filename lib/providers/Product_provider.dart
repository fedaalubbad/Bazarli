import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_helper/product_api.dart';

class ProductProvider extends ChangeNotifier{
    List<Product> productList=[];

  Future<List<Product>> getAllProducts() async {
    List<Product> products = await ProductApi.api.getAllProducts();
    this.productList = products;
    notifyListeners();
    return productList;
  }

    Stream<Response> getTopProducts(){
    Stream<Response> stream= ProductApi.api.getTopProducts();
    return stream;
  }

}
