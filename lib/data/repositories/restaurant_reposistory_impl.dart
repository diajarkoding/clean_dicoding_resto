import 'dart:io';

import 'package:clean_dicoding_resto/data/datasources/restaurant_remote_data_source.dart';
import 'package:clean_dicoding_resto/domain/entities/restaurant_detail.dart';
import 'package:clean_dicoding_resto/domain/entities/restaurant.dart';
import 'package:clean_dicoding_resto/common/failur.dart';
import 'package:clean_dicoding_resto/domain/repositories/restaurant_revository.dart';
import 'package:dartz/dartz.dart';

import '../../common/exception.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;

  RestaurantRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurant() async {
    try {
      final result = await remoteDataSource.getRestaurant();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, RestaurantDetail>> getRestaurantDetail(
      String id) async {
    try {
      final result = await remoteDataSource.getRestaurantDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
