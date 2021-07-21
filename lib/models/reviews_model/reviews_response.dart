import 'package:bazarli/models/reviews_model/review_classes/review_data.dart';

import 'review_classes/links.dart';
import 'review_classes/meta.dart';

class ReviewsResponse {
  List<ReviewData> data;
  Links links;
  Meta meta;

  ReviewsResponse({this.data, this.links, this.meta});

  ReviewsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ReviewData>();
      json['data'].forEach((v) {
        data.add(new ReviewData.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}