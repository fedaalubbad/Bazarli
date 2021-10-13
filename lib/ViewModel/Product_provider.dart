import 'package:bazarli/models/product_model/product_response.dart';
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
      double rate=1.0;
      List<int> price;
      int size;
      int newArrivals;
      int selectedVarientIndex = 0;
      dynamic selectedVarientId;

      final GlobalKey<FormState> priceFormStateKey = GlobalKey<FormState>();
      final minPriceController = TextEditingController();
      final maxPriceController = TextEditingController();
      ProductResponse productRespone;
    List<Datum> productList=[];
    List<Datum> productSearchResultList=[];

      saveinitialPrice(val) {
        price[0] = val;
        notifyListeners();
      }

      saveEndPrice(val) {
        price[1] = val;
        notifyListeners();
      }


      selectVarientIndex(val) {
        selectedVarientIndex = val;
        notifyListeners();
      }
      selectVarientId(val) {
        selectedVarientId = val;
        notifyListeners();
      }

      int quantity=1;
      int availableQuantity;

      increaseQuantity(){
        // if(quantity<=availableQuantity)
        quantity+=1;
        notifyListeners();
      }
      decreaseQuantity(){
        if(quantity>1)
         quantity-=1;
        notifyListeners();
      }
      String getSize(product,index) {
        return product.superAttributes[1].options.where((element) =>
        element.id == product.variants[index].size).map((e) {
          return e.adminName;
        }
        ).toString().replaceAll("(",'').replaceAll(')', '');
      }
      String getColors(product,index){
      return product.superAttributes[0].options.where((element) => element.id==product.variants[index].color).map((e) {
        return e.adminName.toString();
       }
       ).toString().replaceAll("(",'').replaceAll(')', '');
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


  Future<ProductResponse> getAllProducts({int productId}) async {
    ProductResponse response = await ProductApi.api.getAllProducts(product_id:productId,);
    this.productList = response.data;
    productRespone=response;
    notifyListeners();
    return productRespone;
  }
      Future<ProductResponse> getSearchProducts({int productId}) async {
        ProductResponse  response= await ProductApi.api.getAllProducts(product_id:productId,category_id:categoryId,search:search,order:order,
            sort:sort,price:price,brand:brandId,size:size,new_arrivals_in:newArrivals);
        productList =  response.data;
        productRespone=response;
        notifyListeners();
        return productRespone;
      }


  //   Stream<Response> getTopProducts(){
  //   Stream<Response> stream= ProductApi.api.getTopProducts();
  //   return stream;
  // }

}
