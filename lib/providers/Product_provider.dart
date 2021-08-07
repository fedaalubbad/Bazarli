import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_helper/product_api.dart';

class ProductProvider extends ChangeNotifier{
    List<Product> productList=[];

  Future<List<Product>> getAllProducts({int productId,int categoryId,String search,String order,String sort,var price,String brand,int size,int newArrivals}) async {
    List<Product> products = await ProductApi.api.getAllProducts(product_id:productId,category_id:categoryId,search:search,order:order,
        sort:sort,price:price,brand:brand,size:size,new_arrivals_in:newArrivals);
    this.productList = products;
    notifyListeners();
    return productList;
  }

  //   Stream<Response> getTopProducts(){
  //   Stream<Response> stream= ProductApi.api.getTopProducts();
  //   return stream;
  // }

}
