import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_helper/product_api.dart';

class ProductProvider extends ChangeNotifier{
      int categoryId;
      String categoryName;
      int brandId;
      String brandName;
      String search;
      String order;
      String sort;
      double rate=0.0;
      List<int> price;
      int size;
      int newArrivals;
      final GlobalKey<FormState> priceFormStateKey = GlobalKey<FormState>();
      final minPriceController = TextEditingController();
      final maxPriceController = TextEditingController();

      List<Product> productList=[];
    List<Product> productSearchResultList=[];

      saveinitialPrice(val) {
        price[0] = val;
        notifyListeners();
      }

      saveEndPrice(val) {
        price[1] = val;
        notifyListeners();
      }

      // String validateMinPrice(val) {
      //   if (val.isEmpty) {
      //     return 'enter min price';
      //   }
      //   return null;
      // }
      //
      // String validateMaxPrice(val) {
      //   if (val.isEmpty) {
      //     return 'enter max price';
      //   }
      //   return null;
      // }

    double getSlider(double value){
            this.rate=value;
            notifyListeners();
            return value;
    }

   int selectBrand(value,name){
      this.brandId=value;
      this.brandName=name;
      notifyListeners();
      print('brandId=$value');
      return value;
    }
   int  selectCategory(value,name){
      this.categoryId=value;
      this.categoryName=name;
      notifyListeners();
      print('catId=$value');
      return value;
    }
  Future<List<Product>> getAllProducts({int productId}) async {
    List<Product> products = await ProductApi.api.getAllProducts(product_id:productId,);
    this.productList = products;
    notifyListeners();
    return productList;
  }
      Future<List<Product>> getSearchProducts({int productId}) async {
        List<Product> products = await ProductApi.api.getAllProducts(product_id:productId,category_id:categoryId,search:search,order:order,
            sort:sort,price:price,brand:brandId,size:size,new_arrivals_in:newArrivals);
        this.productList = products;
        notifyListeners();
        return productList;
      }


  //   Stream<Response> getTopProducts(){
  //   Stream<Response> stream= ProductApi.api.getTopProducts();
  //   return stream;
  // }

}
