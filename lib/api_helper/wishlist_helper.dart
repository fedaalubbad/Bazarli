import 'package:bazarli/models/wish_list_model/wishlist.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';

import 'constants.dart';

class WishListApi {
  WishListApi._();

  static WishListApi api = WishListApi._();
  Dio dio = Dio();
  Options options = Options(
    followRedirects: false,
    validateStatus: (status) {
      return status < 500;
    },
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + SPHelper.spHelper.getToken(),
    },
  );

  Future<List<WishList>> getCustomerWishList() async {
    print('token' + SPHelper.spHelper.getToken());
    dio.options.headers["authorization"] =
    "Bearer ${SPHelper.spHelper.getToken()}";
    Response response = await dio.get(baseUrl + GET_WISHLIST_URL);
    print('wishListJson${response.data}');

    Map<String, dynamic> responseBody = response.data;
    List<dynamic> mapList = responseBody["data"];
    List<WishList> wishList = mapList.map((e) => WishList.fromJson(e)).toList();
    print('wishList${wishList}');
    return wishList;
  }

  Future<Map<String, dynamic>> addToWishList(String productId) async {
    dio.options.headers["authorization"] =
    "Bearer ${SPHelper.spHelper.getToken()}";

    final formData = {
      'token': null,
    };
    Map<String, dynamic> status = Map<String, dynamic>();
    Response response = await dio.get(
        baseUrl + ADD_TO_WISHLIST + '/$productId' + '?token=true');

    var statusCode = response.statusCode;
    print(baseUrl + ADD_TO_WISHLIST + '/$productId' + '?token=true');
    print(SPHelper.spHelper.getToken());
    print(response.data);
    if (statusCode == 200) {
      Map<String, dynamic> responseBody = response.data;

      if (responseBody['data'] == null) {
        status = {
          'wishListResponse': responseBody['data'],
          'message': responseBody['message'],
          'status': true
        };
        return status;
      } else {
        Map<String, dynamic> responseBody = response.data;
        WishList wishList = WishList.fromJson(responseBody['data']);
        status = {
          'wishListResponse': wishList,
          'message': responseBody['message'],
          'status': true
        };

        print('addWishListJson${responseBody}');
        return status;
      }
    } else {
      status = {'errorMessage': 'failed', 'status': false};
      print('addWishListError${response.statusMessage}');
      return status;
    }
  }



  Future moveWishListToCart(String productId) async {
    dio.options.headers["authorization"] =
    "Bearer ${SPHelper.spHelper.getToken()}";

    final formData = {
      'token': null,
    };
    Map<String, dynamic> status = Map<String, dynamic>();
    Response response = await dio.get(
        baseUrl + MOVE_TO_CART + '/$productId' + '?token=true');

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
      // } else {
      //   Map<String, dynamic> responseBody = response.data;
      //   WishList wishList = WishList.fromJson(responseBody['data']);
      //   status = {
      //     'wishListResponse': wishList,
      //     'message': responseBody['message'],
      //     'status': true
      //   };

        print('addWishListJson${responseBody}');
        return status;
      // }
    } else {
      status = {'errorMessage': 'failed', 'status': false};
      print('addWishListError${response.statusMessage}');
      return status;
    }
  }
}
