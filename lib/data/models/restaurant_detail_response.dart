import 'package:clean_dicoding_resto/data/models/restaurant_detail_model.dart';

class RestaurantDetailResponse {
  RestaurantDetailResponse({
    required this.restaurant,
  });

  RestaurantDetailModel restaurant;

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailResponse(
        restaurant: RestaurantDetailModel.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "restaurant": restaurant.toJson(),
      };
}
