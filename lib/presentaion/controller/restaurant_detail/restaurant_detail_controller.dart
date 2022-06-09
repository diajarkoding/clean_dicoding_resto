import 'package:clean_dicoding_resto/domain/usecases/get_restaurant_detail.dart';
import 'package:get/get.dart';

import '../../../common/state_enum.dart';
import '../../../domain/entities/restaurant_detail.dart';

class RestaurantDetailController extends GetxController {
  final GetRestaurantDetail getRestaurantDetail;

  RestaurantDetailController({
    required this.getRestaurantDetail,
  });

  RestaurantDetail? _restaurantDetail;

  RestaurantDetail? get restaurantDetail => _restaurantDetail;

  RequestState _restaurantDetailState = RequestState.empty;

  RequestState get restaurantDetailState => _restaurantDetailState;

  void infoMessage(String massage) {
    Get.snackbar('Info', massage);
  }

  // final String _id = Get.arguments;

  Future<void> fetchRestoDetail(String id) async {
    try {
      _restaurantDetailState = RequestState.loading;

      final result = await getRestaurantDetail.execute(id);

      result.fold((failur) {
        _restaurantDetailState = RequestState.error;

        infoMessage(failur.message);
      }, (restaurantsData) {
        _restaurantDetailState = RequestState.loaded;

        _restaurantDetail = restaurantsData;

        update();
      });
    } catch (e) {
      print(e);
    }
  }

  // @override
  // void onInit() async {
  //   super.onInit();
  //   await fetchRestoDetail(_id);
  // }
}
