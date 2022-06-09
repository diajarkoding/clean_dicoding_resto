import 'package:clean_dicoding_resto/domain/entities/restaurant_detail.dart';
import 'package:clean_dicoding_resto/domain/repositories/restaurant_revository.dart';
import 'package:dartz/dartz.dart';

import '../../common/failur.dart';

class GetRestaurantDetail {
  final RestaurantRepository repository;

  GetRestaurantDetail(this.repository);

  Future<Either<Failure, RestaurantDetail>> execute(String id) {
    return repository.getRestaurantDetail(id);
  }
}
