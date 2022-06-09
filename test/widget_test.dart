import 'dart:convert';

import 'package:clean_dicoding_resto/common/exception.dart';
import 'package:clean_dicoding_resto/data/models/restaurant_detail_model.dart';
import 'package:clean_dicoding_resto/data/models/restaurant_detail_response.dart';
import 'package:clean_dicoding_resto/data/models/restaurant_model.dart';
import 'package:clean_dicoding_resto/data/models/restaurant_response.dart';
import 'package:http/http.dart' as http;

void main() async {
  const String baseUrL = 'https://restaurant-api.dicoding.dev';

  Future<RestaurantDetailModel> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse('$baseUrL/detail/$id'));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(json.decode(response.body))
          .restaurant;
    } else {
      throw ServerException();
    }
  }

  var data = await getRestaurantDetail('ateyf7m737ekfw1e867');
  print(data);
}
