import 'package:clean_dicoding_resto/data/datasources/restaurant_remote_data_source.dart';
import 'package:clean_dicoding_resto/data/repositories/restaurant_reposistory_impl.dart';
import 'package:clean_dicoding_resto/domain/repositories/restaurant_revository.dart';
import 'package:clean_dicoding_resto/domain/usecases/get_restaurant.dart';
import 'package:clean_dicoding_resto/domain/usecases/get_restaurant_detail.dart';
import 'package:clean_dicoding_resto/presentaion/controller/restaurant/restaurant_list_controller.dart';
import 'package:clean_dicoding_resto/presentaion/controller/restaurant_detail/restaurant_detail_controller.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class DependencyCreator {
  static init() {
    Get.lazyPut(() => RestaurantListController(getRestaurant: Get.find()));
    Get.lazyPut(() => RestaurantDetailController(
          getRestaurantDetail: Get.find(),
        ));

    Get.lazyPut(() => GetRestaurant(Get.find()));
    Get.lazyPut(() => GetRestaurantDetail(Get.find()));

    Get.lazyPut<RestaurantRepository>(
        () => RestaurantRepositoryImpl(Get.find()));

    Get.lazyPut<RestaurantRemoteDataSource>(
        () => RestaurantRemoteDataSourceImpl(client: Get.find()));

    Get.lazyPut(() => http.Client());
  }
}
