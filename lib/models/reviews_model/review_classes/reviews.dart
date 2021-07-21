class Reviews {
  int total;
  int totalRating;
  int averageRating;
  List percentage;

  Reviews({this.total, this.totalRating, this.averageRating, this.percentage});

  Reviews.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalRating = json['total_rating'];
    averageRating = json['average_rating'];
    percentage=json['percentage'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['total_rating'] = this.totalRating;
    data['average_rating'] = this.averageRating;
    if (this.percentage != null) {
      data['percentage'] = this.percentage.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
