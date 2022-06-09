import 'package:clean_dicoding_resto/domain/repositories/restaurant_revository.dart';
import 'package:clean_dicoding_resto/domain/usecases/get_restaurant.dart';
import 'package:get/get.dart';

class RestaurantBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => RestaurantListController(Get.find()));
    Get.lazyPut(() => GetRestaurant(Get.find<RestaurantRepository>()));
  }
}
