import 'package:bazarli/models/cart_model/get_orders_response.dart' as ordersResponse;
import 'package:bazarli/models/cart_model/payment_methods.dart';
import 'package:bazarli/models/cart_model/save_order_response.dart';
import 'package:bazarli/models/cart_model/shipping_methods.dart';
import 'package:bazarli/api_helper/orders_helper.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:bazarli/models/cart_model/add_to_cart_model.dart';
import 'package:bazarli/models/cart_model/get_cart_response.dart';
import 'package:flutter/cupertino.dart';
import '../models/cart_model/address_rates.dart';

class OrdersProvider extends ChangeNotifier{
bool isLoading=false;

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
   isLoading=true;
   notifyListeners();
   try{
   AddressRates response=  await  OrdersApi.api.getAddressRates(context,address);
   addressRates=response;
   getShippingMethods( context,addressRates.data.rates[1]);
   // isLoading=false;
   // notifyListeners();
  } catch (e) {
  isLoading=false;
  notifyListeners();
   throw Exception();

}
   }
 DataRate selectedDataRate=null;
 selectAddressRate(context,DataRate val){
  selectedDataRate=val;
  getShippingMethods(context,val);
  notifyListeners();
 }
  ShippingMethods shippingMethods;
  Future<ShippingMethods> getShippingMethods(BuildContext context,DataRate addressRate)async{
   // isLoading=true;
   // notifyListeners();
   try{
  ShippingMethods response=  await  OrdersApi.api.getShippingMethods(context,addressRate);
  shippingMethods=response;
  getPaymentMethods(context, shippingMethods.data.methods[0]);
  notifyListeners();
  // isLoading=false;
  // notifyListeners();
   } catch (e) {
    isLoading=false;
    notifyListeners();
    throw Exception();

   }
   }
 Method selectedShippingMethod=null;
 selectShippingMethod(context,Method val){
  selectedShippingMethod=val;
  getPaymentMethods(context,val);
  notifyListeners();
 }

  PaymentMethod paymentMethods;
  dynamic catrId=null;
  Future<PaymentMethod> getPaymentMethods(BuildContext context,Method shippingMethods)async{
   // isLoading=true;
   // notifyListeners();
   try{
   PaymentMethod response=  await  OrdersApi.api.getPaymentMethods(context,shippingMethods);
   catrId=response.data.cart.id;
   paymentMethods=response;
   notifyListeners();
   isLoading=false;
   notifyListeners();
  } catch (e) {
isLoading=false;
notifyListeners();
throw Exception();

}
  }
 PaymentMethods selectedPaymentMethod=null;
 selectPaymentMethod(context,PaymentMethods val){
  selectedPaymentMethod=val;
  notifyListeners();
 }


 SaveOrderResponse saveOrderResponse;
 String redirectUrl='';
  Future<SaveOrderResponse> saveOrder(BuildContext context,dynamic cartId, PaymentMethods method)async{
   SaveOrderResponse response=  await  OrdersApi.api.saveOrder(context,cartId:cartId,method:method);
   saveOrderResponse=response;
   if(method!=null){
    redirectUrl=saveOrderResponse.redirectUrl;
   }
   notifyListeners();
  }

 ordersResponse.GetOrderResponse getOrderResponse;
  Future<ordersResponse.GetOrderResponse> getOrders(lang)async{
   ordersResponse.GetOrderResponse response=  await  OrdersApi.api.getOrders(lang);
   getOrderResponse=response;
   notifyListeners();
  }

}