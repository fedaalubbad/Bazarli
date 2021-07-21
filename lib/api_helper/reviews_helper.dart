import 'package:bazarli/models/reviews_model/give_review_response.dart';
import 'package:bazarli/models/reviews_model/review_classes/review_data.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';
import 'constants.dart';

class ReviewsApi{
  ReviewsApi._();
  static ReviewsApi api=ReviewsApi._();
  Dio dio=Dio();
  Options options=Options(
    followRedirects: false,
    validateStatus: (status) {
      return status < 500;
    },
    headers : { "contentType":"application/json","Authorization":"Bearer ${SPHelper.spHelper.getToken()}"},
  );

  Future<List<ReviewData>> getCustomerReviewsList() async{
    final formData = {
      'token':null,
    };
    Response response = await dio.get(baseUrl + GET_REVIEWS_URL,options: options);

    Map<String,dynamic> responseBody=response.data;
    print('reviewListJson${responseBody}');
    List<dynamic> mapList = responseBody["data"];
    List<ReviewData> reviewList = mapList.map((e) =>ReviewData.fromJson(e)).toList();
    print('reviewList${reviewList}');
    return reviewList;
  }


  Future<GiveReviewsResponse> giveReview(String product_id,String rating,String title,String comment,String name) async{
    final formData = {
      'product_id':product_id,
      'rating':rating,
      'title':title,
      'comment':comment,
      'name':name,
    };
    Response response = await dio.post(baseUrl + GET_REVIEWS_URL+'/$product_id/create',options: options,data: formData);

    Map<String,dynamic> responseBody=response.data;
    print('addReviewJson${responseBody}');

    // return wishList;
  }

  Future<void> deleteReview(String product_id) async{

    Response response = await dio.delete(baseUrl + GET_REVIEWS_URL+'/$product_id',options: options);

    Map<String,dynamic> responseBody=response.data;
    print('deleteReviewJson${responseBody}');

  }



}