import 'package:bazarli/models/reviews_model/give_review_response.dart';
import 'package:bazarli/models/reviews_model/review_classes/review_data.dart';
import 'package:dio/dio.dart';
import 'constants_urls.dart';
import 'dio_settings.dart';

class ReviewsApi{
  ReviewsApi._();
  static ReviewsApi api=ReviewsApi._();

  Future<List<ReviewData>> getCustomerReviewsList() async{

    Response response = await Settings.settings.dio.get(GET_REVIEWS_URL);

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
    Response response = await Settings.settings.dio.post(GET_REVIEWS_URL+'/$product_id/create',data: formData);

    Map<String,dynamic> responseBody=response.data;
    print('addReviewJson${responseBody}');

    // return wishList;
  }

  Future<void> deleteReview(String product_id) async{
    Response response = await Settings.settings.dio.delete(GET_REVIEWS_URL+'/$product_id');

    Map<String,dynamic> responseBody=response.data;
    print('deleteReviewJson${responseBody}');

  }



}