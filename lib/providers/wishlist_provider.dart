import 'package:bazarli/api_helper/wishlist_helper.dart';
import 'package:bazarli/models/wish_list_model/wishlist.dart';
import 'package:flutter/material.dart';

class WishListProvider extends ChangeNotifier{
  List<WishList> wishList=[];
  bool isFav;

  Future<List<WishList>> getCustomerWishList() async {
    this.wishList= await WishListApi.api.getCustomerWishList();
    notifyListeners();
    return wishList;
  }

  Future addToWishList(int productId)async{
    await WishListApi.api.addToWishList(productId.toString());
  }

  Future moveWishListToCart(String productId)async{
    await WishListApi.api.moveWishListToCart(productId);
  }
}