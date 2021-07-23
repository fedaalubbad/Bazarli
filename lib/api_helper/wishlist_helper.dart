import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:bazarli/models/wish_list_model/wishlist.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';

import 'constants.dart';

class WishListApi {
  WishListApi._();

  static WishListApi api = WishListApi._();
  Dio dio = Dio();
  // Options options = Options(
  //   followRedirects: false,
  //   validateStatus: (status) {
  //     return status < 500;
  //   },
  //   headers: {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     // "Authorization": "Bearer "+SPHelper.spHelper.getToken(),
  //   },
  // );

  Future<List<WishList>> getCustomerWishList() async {
    print('token'+SPHelper.spHelper.getToken());
    dio.options.headers["authorization"]="Bearer ${SPHelper.spHelper.getToken()}";
    Response response = await dio.get(baseUrl + GET_WISHLIST_URL);
    print('wishListJson${response.data}');

    Map<String,dynamic> responseBody=response.data;
    List<dynamic> mapList = responseBody["data"];
    List<WishList> wishList= mapList.map((e) =>WishList.fromJson(e)).toList();
    print('wishList${wishList}');
    return wishList;
  }
  Future<WishList> addToWishList(String productId) async {
    final formData = {
      'token': null,
    };
    Response response = await dio.get(baseUrl + ADD_TO_WISHLIST + '/$productId'+'?token=true');

    var statusCode = response.statusCode;
    print('addWishListCode${statusCode}');
    if(statusCode==200){
      Map<String,dynamic> responseBody=response.data;
      print('addWishListJson${responseBody}');

    }else{
      print('addWishListError${response.statusMessage}');

    }
  }

  Future moveWishListToCart(String productId) async {
    final formData = {
      'token': null,
    };
    Response response = await dio.get(baseUrl + MOVE_TO_CART + '/$productId');

    var responseBody = response.statusCode;
    print('moveWishListCartJson${responseBody}');
  }
}
