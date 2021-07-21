import 'package:bazarli/models/product_model/product_classes/Data.dart';
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
      "contentType": "application/json",
      "Authorization": "Bearer ${SPHelper.spHelper.getToken()}"
    },
  );

  Future getCustomerWishList() async {
    final formData = {
      'token': null,
    };
    Response response =
        await dio.get(baseUrl + GET_WISHLIST_URL, options: options);

    var responseBody = response.statusCode;
    print('wishListJson${responseBody}');
  }

  Future addToWishList(String productId) async {
    final formData = {
      'token': null,
    };
    Response response = await dio.get(baseUrl + ADD_TO_WISHLIST + '/$productId',
        options: options);

    var responseBody = response.statusCode;
    print('addWishListJson${responseBody}');
  }
  Future moveWishListToCart(String productId) async {
    final formData = {
      'token': null,
    };
    Response response = await dio.get(baseUrl + MOVE_TO_CART + '/$productId',
        options: options);

    var responseBody = response.statusCode;
    print('moveWishListCartJson${responseBody}');
  }
}
