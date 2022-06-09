import 'package:clean_dicoding_resto/data/datasources/restaurant_remote_data_source.dart';
import 'package:clean_dicoding_resto/data/repositories/restaurant_reposistory_impl.dart';
import 'package:clean_dicoding_resto/domain/repositories/restaurant_revository.dart';
import 'package:clean_dicoding_resto/domain/usecases/get_restaurant.dart';
import 'package:clean_dicoding_resto/presentaion/controller/restaurant/restaurant_list_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // Controller
  locator.registerFactory(
      () => RestaurantListController(getRestaurant: locator()));

  // Use Case
  locator.registerLazySingleton(() => GetRestaurant(locator()));
// Repository
  locator.registerLazySingleton<RestaurantRepository>(
      () => RestaurantRepositoryImpl(locator()));
  // Data source
  locator.registerLazySingleton<RestaurantRemoteDataSource>(
      () => RestaurantRemoteDataSourceImpl(client: locator()));
  // External
  locator.registerLazySingleton(() => http.Client());
}
