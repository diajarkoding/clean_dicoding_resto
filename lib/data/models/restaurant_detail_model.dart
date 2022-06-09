import 'package:clean_dicoding_resto/domain/entities/restaurant_detail.dart';

import 'category_model.dart';
import 'customer_review_model.dart';
import 'menus_model.dart';

class RestaurantDetailModel {
  RestaurantDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  List<CategoryModel> categories;
  MenusModel menus;
  double rating;
  List<CustomerReviewModel> customerReviews;

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromJson(x))),
        menus: MenusModel.fromJson(json["menus"]),
        rating: json["rating"].toDouble(),
        customerReviews: List<CustomerReviewModel>.from(json["customerReviews"]
            .map((x) => CustomerReviewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "menus": menus.toJson(),
        "rating": rating,
        "customerReviews":
            List<dynamic>.from(customerReviews.map((x) => x.toJson())),
      };

  RestaurantDetail toEntity() {
    return RestaurantDetail(
        id: id,
        name: name,
        description: description,
        city: city,
        address: address,
        pictureId: pictureId,
        categories: categories.map((e) => e.toEntity()).toList(),
        menus: menus.toEntity(),
        rating: rating,
        customerReviews: customerReviews.map((e) => e.toEntity()).toList());
  }
}
