import 'dart:convert';

import 'package:clean_dicoding_resto/data/models/restaurant_detail_model.dart';
import 'package:clean_dicoding_resto/data/models/restaurant_detail_response.dart';
import 'package:clean_dicoding_resto/data/models/restaurant_model.dart';
import 'package:clean_dicoding_resto/data/models/restaurant_response.dart';
import 'package:http/http.dart' as http;

import '../../common/exception.dart';

abstract class RestaurantRemoteDataSource {
  Future<List<RestaurantModel>> getRestaurant();

  Future<RestaurantDetailModel> getRestaurantDetail(String id);
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  static const String baseUrL = 'https://restaurant-api.dicoding.dev';

  final http.Client client;

  RestaurantRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RestaurantModel>> getRestaurant() async {
    final response = await client.get(Uri.parse('$baseUrL/list'));

    if (response.statusCode == 200) {
      return RestaurantResponse.fromJson(json.decode(response.body))
          .restaurantResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<RestaurantDetailModel> getRestaurantDetail(String id) async {
    final response = await client.get(Uri.parse('$baseUrL/detail/$id'));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(json.decode(response.body))
          .restaurant;
    } else {
      throw ServerException();
    }
  }
}
