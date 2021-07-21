import 'package:bazarli/models/reviews_model/give_review_response.dart';
import 'package:bazarli/models/supplier_order_model/supplier_order_classes/supplier_order_data.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';
import 'constants.dart';

class SupplierOrdersApi{
  SupplierOrdersApi._();
  static SupplierOrdersApi api=SupplierOrdersApi._();
  Dio dio=Dio();
  Options options=Options(
    followRedirects: false,
    validateStatus: (status) {
      return status < 500;
    },
    headers : { "contentType":"application/json","Authorization":"Bearer ${SPHelper.spHelper.getToken()}"},
  );

  Future<List<SupplierOrderData>> getSupplierOOrdersList() async{
    final formData = {
      'token':null,
    };
    Response response = await dio.get(baseUrl + GET_SUPPLIER_ORDERS_URL,options: options);

    Map<String,dynamic> responseBody=response.data;
    print('ordersListJson${responseBody}');
    List<dynamic> mapList = responseBody["data"];
    List<SupplierOrderData> ordersList = mapList.map((e) =>SupplierOrderData.fromJson(e)).toList();
    print('ordersList${ordersList}');
    return ordersList;
  }


  Future<GiveReviewsResponse> cancelItemOrder(String order_id,String item_id) async{
    final formData = {
      'order_id':order_id,
      'item_id':item_id,

    };
    Response response = await dio.post(baseUrl + CANCEL_ITEM_ORDERS_URL,options: options,data: formData);

    Map<String,dynamic> responseBody=response.data;
    print('cancelOrderJson${responseBody}');

    // return wishList;
  }

  // Future<void> shippOrder(String order_id,String item_id,carrier_title,track_number,source,items[6][1]) async{
  //   final formData = {
  //     'order_id':order_id,
  //     'item_id':item_id,
  //     'items[6][1]':items[6][1],
  //     'carrier_title':carrier_title,
  //     'track_number':track_number,
  //     'source':source,
  //
  //   };
  //   Response response = await dio.post(baseUrl +SHIPPED_ITEM_ORDERS_URL,options: options,data: formData);
  //
  //   Map<String,dynamic> responseBody=response.data;
  //   print('shippOrderJson${responseBody}');
  //
  // }

  Future<void> orderItemInvoices(String order_id,String item_id) async{
    final formData = {
      'order_id':order_id,
      'item_id':item_id,

    };
    Response response = await dio.post(baseUrl +INVOICE_ITEM_ORDERS_URL,options: options,data: formData);

    Map<String,dynamic> responseBody=response.data;
    print('OrderInvoiceJson${responseBody}');

    // return wishList;
  }
 Future<void> refundOrderItem(String order_id,String item_id) async{
    final formData = {
      'order_id':order_id,
      'item_id':item_id,

    };
    Response response = await dio.post(baseUrl +REFUND_PAYMENT_ITEM_ORDERS_URL,options: options,data: formData);

    Map<String,dynamic> responseBody=response.data;
    print('OrderRefundeJson${responseBody}');

    // return wishList;
  }

}