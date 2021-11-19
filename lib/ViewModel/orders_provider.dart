import 'package:bazarli/ViewModel/payment_methods.dart';
import 'package:bazarli/ViewModel/save_order_response.dart';
import 'package:bazarli/ViewModel/shipping_methods.dart';
import 'package:bazarli/api_helper/orders_helper.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:bazarli/models/cart_model/add_to_cart_model.dart';
import 'package:bazarli/models/cart_model/get_cart_response.dart';
import 'package:flutter/cupertino.dart';

import 'address_rates.dart';

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
  AddressRates addressRates;
  Future<AddressRates> getAddressRates(BuildContext context,Datum address)async{
  AddressRates response=  await  OrdersApi.api.getAddressRates(context,address);
  addressRates=response;
   }
 DataRate selectedDataRate=null;
 selectAddressRate(context,DataRate val){
  selectedDataRate=val;
  getShippingMethods(context,val);
  notifyListeners();
 }
  ShippingMethods shippingMethods;
  Future<ShippingMethods> getShippingMethods(BuildContext context,DataRate addressRate)async{
  ShippingMethods response=  await  OrdersApi.api.getShippingMethods(context,addressRate);
  shippingMethods=response;
  notifyListeners();
   }
 Method selectedShippingMethod=null;
 selectShippingMethod(context,Method val){
  selectedShippingMethod=val;
  getPaymentMethods(context,val);
  notifyListeners();
 }

  PaymentMethods paymentMethods;
  dynamic catrId=null;
  Future<PaymentMethods> getPaymentMethods(BuildContext context,Method shippingMethods)async{
   PaymentMethods response=  await  OrdersApi.api.getPaymentMethods(context,shippingMethods);
   catrId=response.data.cart.id;
   paymentMethods=response;
   notifyListeners();
  }
 PaymentMethod selectedPaymentMethod=null;
 selectPaymentMethod(context,PaymentMethod val){
  selectedPaymentMethod=val;
  notifyListeners();
 }


 SaveOrderResponse saveOrderResponse;
  Future<SaveOrderResponse> saveOrder(BuildContext context,dynamic cartId, PaymentMethod method)async{
   SaveOrderResponse response=  await  OrdersApi.api.saveOrder(context,cartId,method);
   saveOrderResponse=response;
   notifyListeners();

  }


}