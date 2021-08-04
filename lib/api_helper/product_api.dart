import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';

import 'constants.dart';
import 'dio_settings.dart';

class ProductApi {
  ProductApi._();
  static ProductApi api = ProductApi._();
  // Dio dio = Dio();
  //
  // Options options = Options(
  //   // followRedirects: false,
  //   // validateStatus: (status) {
  //   //   return status < 500;
  //   // },
  //   headers: {"Accept": "application/json", "Authorization": "Bearer "},
  // );

  Future<List<Product>> getAllProducts({product_id,category_id,search,order,sort,price,brand,size,new_arrivals_in}) async {
    final formData = {
      if(product_id!=null)
      'product_id': product_id,
      if(category_id!=null)
      'category_id': category_id,
      if(search!=null)
      'search': search,
      if(order!=null)
      'order': order,
      if(sort!=null)
      'sort': sort,
      if(price!=null)
      'price': price,
      if(brand!=null)
      'brand': brand,
      if(size!=null)
      'size': size,
      if(new_arrivals_in!=null)
      'new_arrivals_in': new_arrivals_in,
    };
    Response response = await Settings.settings.dio.post(GET_PRODUCTS_URL);

    Map<String, dynamic> responseBody = response.data;
    print('productListJson${responseBody}');
    List<dynamic> mapList = responseBody["data"];
    List<Product> productsList =
        mapList.map((e) => Product.fromJson(e)).toList();
    print('productsList${productsList}');
    return productsList;
  }

  // Stream<Response> getTopProducts() async* {
  //   yield* Stream.periodic(Duration(seconds: 5), (_) {
  //     return dio.post(
  //       baseUrl + GET_PRODUCTS_URL,
  //     );
  //   }).asyncMap((event) async => await event);
  // }

  //  Future<UserModel> getUSerById(String userId)async{
  //    Response response = await dio.get(baseUrl + users+userId,
  //        options : options);
  //    Map<String,dynamic> responseBody=response.data;
  //    print('userJson${responseBody}');
  //    UserModel user=UserModel.fromJson(responseBody);
  //    return user;
  //  }
  // Future<List<PostModel>> getAllPosts()async{
  //    Response response = await dio.get(baseUrl + posts,
  //        options : options);
  //    Map<String,dynamic> responseBody=response.data;
  //    print('parseJson${responseBody}');
  //    List<dynamic> mapList = responseBody["data"];
  //    // print('parseList${mapList}');
  //    List<PostModel> postsList = mapList.map((e) => PostModel.fromJson(e)).toList();
  //    // print('parseList${postsList}');
  //    return postsList;
  //  }
  //  Future<List<PostModel>> getPostByUserId(String userId)async{
  //    Response response = await dio.get(baseUrl + users+userId+"/"+posts,
  //        options : options);
  //    Map<String,dynamic> responseBody=response.data;
  //    print('postsJson${responseBody}');
  //    List<dynamic> mapList = responseBody["data"];
  //    // print('parseList${mapList}');
  //    List<PostModel> postsList = mapList.map((e) => PostModel.fromJson(e)).toList();
  //    // print('parseList${postsList}');
  //    return postsList;
  //  }
  // Future<List<PostModel>> getPostsByTags(String tagTitle)async{
  //    Response response = await dio.get(baseUrl + posts+tagTitle,
  //        options : options);
  //    Map<String,dynamic> responseBody=response.data;
  //    print('parseJson${responseBody}');
  //    List<dynamic> mapList = responseBody["data"];
  //    // print('parseList${mapList}');
  //    List<PostModel> postsList = mapList.map((e) => PostModel.fromJson(e)).toList();
  //    // print('parseList${postsList}');
  //    return postsList;
  //
  //  }
  //  getPostsComments(String postId)async{
  //    Response response = await dio.get(baseUrl + posts+postId+'/'+postComments,
  //        options : options);
  //    print(response.data);
  //  }
  //
  // Future<List<TagModel>> getAllTags()async{
  //    Response response = await dio.get(baseUrl + tags,
  //        options : options);
  //    print('tagsJson${response.data}');
  //    Map<String,dynamic> responseBody=response.data;
  //    List<dynamic> mapList = responseBody["data"];
  //    // print('parseList${mapList}');
  //    List<TagModel> tagsList = mapList.map((e) => TagModel.fromJson(e)).toList();
  //    // print('parseList${postsList}');
  //    return tagsList;
  //  }

}
