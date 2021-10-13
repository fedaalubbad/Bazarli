import 'package:bazarli/api_helper/orders_helper.dart';
import 'package:bazarli/models/cart_model/add_to_cart_model.dart';
import 'package:bazarli/models/cart_model/get_cart_response.dart';
import 'package:flutter/cupertino.dart';

class OrdersProvider extends ChangeNotifier{

   // List<getCartResponse.Data> careList = [];
 GetCartResponse getCartResponse;

 Future<GetCartResponse>getCart(BuildContext context)async{
  GetCartResponse getCart = await OrdersApi.api.getCart(context);
  if(getCart!=null) {
   getCartResponse= getCart;
   notifyListeners();
  }
   return  getCartResponse;
  }

   addProductToCart(BuildContext context,dynamic productId,dynamic quantity)async{
    AddToCart addCart = await OrdersApi.api.addProductToCart(context,productId,quantity);
    getCart(context);
  }


   Future removeItemFromCart(context,productId)async{
    await  OrdersApi.api.removeItemFromCart(context,productId);
    getCart(context);

   }
   Future updateCartItem(context,productId,newQty)async{
    await  OrdersApi.api.updateCartItem(context,productId,newQty);
    getCart(context);

   }


}