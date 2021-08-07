import 'package:bazarli/models/wish_list_model/wishlist.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';
import 'constants.dart';
import 'dio_settings.dart';

class WishListApi {
  WishListApi._();

  static WishListApi api = WishListApi._();


  Future<List<WishData>> getCustomerWishList() async {

    Response response = await Settings.settings.dio.get(GET_WISHLIST_URL);
    print('wishListJson${response.data}');

    Map<String, dynamic> responseBody = response.data;
    List<dynamic> mapList = responseBody["data"];
    List<WishData> wishList = mapList.map((e) => WishData.fromJson(e)).toList();
    print('wishList${wishList}');
    return wishList;
  }

  Future<Map<String, dynamic>> addToWishList(String productId) async {

    // Map<String, dynamic> status = Map<String, dynamic>();
    Response response = await Settings.settings.dio.get(ADD_TO_WISHLIST + '/$productId'+'?token=true');

    var statusCode = response.statusCode;
    // print(baseUrl + ADD_TO_WISHLIST + '/$productId' + '?token=true');
    print(SPHelper.spHelper.getToken());
    print(response.data);
    if (statusCode == 200) {
      Map<String,dynamic> responseBody=response.data;
      if (responseBody['data']!= null) {
        Map<String, dynamic> responseBody = response.data;
        // WishlistResponse responseBody = WishlistResponse.fromJson(response.data);
        // status = {
        //   'wishListResponse': responseBody.wishData,
        //   'message': responseBody.message,
        //   'status': true
        // };
        return responseBody;
      } else {
        Map<String, dynamic> responseBody = response.data;
        // WishlistResponse wishList = WishlistResponse.fromJson(responseBody);
        // status = {
        //   'wishListResponse': wishList.wishData,
        //   'message': wishList.message,
        //   'status': false
        // };

        print('addWishListJson${responseBody}');
        return responseBody;
      }
    } else {
      // status = {'errorMessage': 'failed', 'status': false};
      print('addWishListError${response.statusMessage}');
      // return status;
    }
  }



  Future moveWishListToCart(String productId) async {

    Map<String, dynamic> status = Map<String, dynamic>();
    Response response = await Settings.settings.dio.get(MOVE_TO_CART + '/$productId' + '?token=true');


    var statusCode = response.statusCode;
    print(baseUrl + MOVE_TO_CART + '/$productId' + '?token=true');
    print(SPHelper.spHelper.getToken());
    print(response.data);
    if (statusCode == 200) {
      Map<String, dynamic> responseBody = response.data;
      // if (responseBody['data'] == null) {
        status = {
          'moveToCart': responseBody['data'],
          'message': responseBody['message'],
          'status': true
        };
        return status;

    } else {
      status = {'errorMessage': 'failed', 'status': false};
      print('addWishListError${response.statusMessage}');
      return status;
    }
  }
}
