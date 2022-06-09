import 'package:clean_dicoding_resto/data/models/restaurant_model.dart';
import 'package:equatable/equatable.dart';

class RestaurantResponse extends Equatable {
  const RestaurantResponse({
    required this.restaurantResponse,
  });

  final List<RestaurantModel> restaurantResponse;

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantResponse(
        restaurantResponse: List<RestaurantModel>.from(
            json["restaurants"].map((x) => RestaurantModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurants":
            List<dynamic>.from(restaurantResponse.map((x) => x.toJson())),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [restaurantResponse];
}
