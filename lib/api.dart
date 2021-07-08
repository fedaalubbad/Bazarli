import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:dio/dio.dart';

class Api{
  Api._();
  static Api api=Api._();
  Dio dio=Dio();
  final String baseUrl='https://test.bazarli.com/api/';
  // Options options=Options(headers : { "app-id":"60bdbd22159b332fec7c83e6"} );
  final String products="products/";


  Future<List<Data>> getAllProducts() async{
    Response response = await dio.get(baseUrl + products,);
    // options : options);
    Map<String,dynamic> responseBody=response.data;
    print('userListJson${responseBody}');
    List<dynamic> mapList = responseBody["data"];
    List<Data> productsList = mapList.map((e) =>Data.fromJson(e)).toList();
    print('productsList${productsList}');
    return productsList;
  }


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