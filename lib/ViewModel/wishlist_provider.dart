import 'package:bazarli/api_helper/wishlist_helper.dart';
import 'package:bazarli/models/wish_list_model/wishlist.dart';
import 'package:flutter/material.dart';

class WishListProvider extends ChangeNotifier{
  WishlistResponse wishList;
  bool isFav=false;

  Future<WishlistResponse> getCustomerWishList() async {
    this.wishList= await WishListApi.api.getCustomerWishList();
    notifyListeners();
    return wishList;
  }

  Future<WishlistResponse> addToWishList(BuildContext context,int productId)async{
    Map<String, dynamic> response=await WishListApi.api.addToWishList(productId.toString());
        if(response!=null){
      // WishList wishListResponse=response['wishListResponse'];
      if(response['data'] == null){
        _showToast(context,response['message']);
        notifyListeners();
      }else{
        _showToast(context,response['message']);
        notifyListeners();
      }
      // print(response['data'].toString());

    }else{
      _showToast(context,'error');
      // print(response['errorMessage']);
    }
  }

  Future moveWishListToCart(BuildContext context,String productId)async{
    Map<String,dynamic> response= await WishListApi.api.moveWishListToCart(productId.toString());
    if(response['status']==true) {
      // WishList wishListResponse=response['wishListResponse'];
      // if (response['wishListResponse'] == null) {
        _showToast(context, response['message']);
        // notifyListeners();
      }
    }

  void _showToast(BuildContext context,String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content:  Text(message),
        // action: SnackBarAction(label: 'Done', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}