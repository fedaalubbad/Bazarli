import 'package:bazarli/api_helper/wishlist_helper.dart';
import 'package:flutter/material.dart';

class WishListProvider extends ChangeNotifier{
  // List<Data> productList=[];

  Future getCustomerWishList() async {
     await WishListApi.api.getCustomerWishList();
    // this.productList = products;
    // notifyListeners();
    // return productList;
  }

  Future addToWishList(String productId)async{
    await WishListApi.api.addToWishList(productId);
  }

  Future moveWishListToCart(String productId)async{
    await WishListApi.api.moveWishListToCart(productId);
  }
}