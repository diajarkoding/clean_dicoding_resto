import 'package:clean_dicoding_resto/domain/entities/restaurant.dart';
import 'package:clean_dicoding_resto/domain/repositories/restaurant_revository.dart';
import 'package:dartz/dartz.dart';

import '../../common/failur.dart';

class GetRestaurant {
  final RestaurantRepository repository;

  GetRestaurant(this.repository);

  Future<Either<Failure, List<Restaurant>>> execute() {
    return repository.getRestaurant();
  }
}
