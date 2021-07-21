import 'package:bazarli/models/reviews_model/review_classes/review_data.dart';

class GiveReviewsResponse {
  String message;
  ReviewData data;

  GiveReviewsResponse({this.message, this.data});

  GiveReviewsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new ReviewData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}