import 'package:bazarli/api_helper/reviews_helper.dart';
import 'package:bazarli/models/reviews_model/give_review_response.dart';
import 'package:bazarli/models/reviews_model/review_classes/review_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewsProvider extends ChangeNotifier{
  List<ReviewData> reviewList=[];

  Future<List<ReviewData>> getAllProducts() async {
    List<ReviewData> reviews = await ReviewsApi.api.getCustomerReviewsList();
    this.reviewList = reviews;
    notifyListeners();
    return reviewList;
  }

  Future<GiveReviewsResponse> giveReview( productId,rating,title,comment)async{
     GiveReviewsResponse giveReviewsResponse=await ReviewsApi.api.giveReview(productId,rating,title,comment);
      return giveReviewsResponse;
  }

  Future deleteReview(String productId )async{
     await ReviewsApi.api.deleteReview(productId);
  }
}
