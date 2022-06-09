import 'package:clean_dicoding_resto/domain/entities/restaurant.dart';
import 'package:clean_dicoding_resto/domain/entities/restaurant_detail.dart';
import 'package:dartz/dartz.dart';

import '../../common/failur.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<Restaurant>>> getRestaurant();

  Future<Either<Failure, RestaurantDetail>> getRestaurantDetail(String id);
}
