import 'package:bazarli/models/reviews_model/give_review_response.dart';
import 'package:bazarli/models/supplier_order_model/supplier_order_classes/supplier_order_data.dart';
import 'package:dio/dio.dart';
import 'constants_urls.dart';
import 'dio_settings.dart';

class SupplierOrdersApi{
  SupplierOrdersApi._();
  static SupplierOrdersApi api=SupplierOrdersApi._();


  Future<List<SupplierOrderData>> getSupplierOOrdersList() async{
    Response response = await Settings.settings.dio.get(GET_SUPPLIER_ORDERS_URL);

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
    Response response = await Settings.settings.dio.post(CANCEL_ITEM_ORDERS_URL,data: formData);

    Map<String,dynamic> responseBody=response.data;
    print('cancelOrderJson${responseBody}');

    // return wishList;
  }

  Future<void> orderItemInvoices(String order_id,String item_id) async{
    final formData = {
      'order_id':order_id,
      'item_id':item_id,

    };
    Response response = await Settings.settings.dio.post(INVOICE_ITEM_ORDERS_URL,data: formData);

    Map<String,dynamic> responseBody=response.data;
    print('OrderInvoiceJson${responseBody}');

    // return wishList;
  }
 Future<void> refundOrderItem(String order_id,String item_id) async{
    final formData = {
      'order_id':order_id,
      'item_id':item_id,

    };
    Response response = await Settings.settings.dio.post(REFUND_PAYMENT_ITEM_ORDERS_URL,data: formData);

    Map<String,dynamic> responseBody=response.data;
    print('OrderRefundeJson${responseBody}');

    // return wishList;
  }

}