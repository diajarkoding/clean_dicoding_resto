import 'package:clean_dicoding_resto/domain/entities/customer_review.dart';

class CustomerReviewModel {
  CustomerReviewModel({
    required this.name,
    required this.review,
    required this.date,
  });

  String name;
  String review;
  String date;

  factory CustomerReviewModel.fromJson(Map<String, dynamic> json) =>
      CustomerReviewModel(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
        "date": date,
      };

  CustomerReview toEntity() {
    return CustomerReview(name: name, review: review, date: date);
  }
}
