import 'package:bazarli/api_helper/orders_helper.dart';
import 'package:bazarli/models/cart_model/add_to_cart_model.dart';
import 'package:bazarli/models/cart_model/cartItem.dart';
import 'package:bazarli/models/cart_model/get_cart_model.dart';
import 'package:flutter/cupertino.dart';

class OrdersProvider extends ChangeNotifier{

   List<CartItem> careList = [];

 getCart(BuildContext context)async{
  GetCart getCart = await OrdersApi.api.getCart(context);
  if(getCart!=null) {
   careList = getCart.data.items;
   notifyListeners();
  }
  print('cart==${careList}');
   return careList;
  }
   addProductToCart(BuildContext context,String productId,int quantity)async{
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