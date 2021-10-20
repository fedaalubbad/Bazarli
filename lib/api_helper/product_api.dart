import 'package:bazarli/models/product_model/product_by_id_response.dart';
import 'package:bazarli/models/product_model/product_response.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'constants_urls.dart';
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

  Future<ProductResponse> getAllProducts({int product_id,int category_id,String search,String order,String sort,var price,int brand,int size,int new_arrivals_in}) async {
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
    try{
    Response response = await Settings.settings.dio.post(GET_PRODUCTS_URL,data: formData);
    if(response.statusCode==200) {
      ProductResponse productsList = ProductResponse.fromJson(response.data);
      return productsList;
    }else{}
  } on DioError catch (e) {
  print('errormsg $e');
  return null;
  }
  }
  Future<GetProductById> getProductById({int product_id}) async {
    try{
    Response response = await Settings.settings.dio.get(GET_PRODUCT_BY_ID_URL+'/$product_id?token=true');
    if(response.statusCode==200) {
      GetProductById product = GetProductById.fromJson(response.data);
      return product;
    }else{

    }
  } on DioError catch (e) {
  print('errormsg $e');
  return null;
  }
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
