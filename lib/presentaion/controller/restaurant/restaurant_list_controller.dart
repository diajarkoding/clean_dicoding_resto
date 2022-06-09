import 'package:clean_dicoding_resto/common/state_enum.dart';
import 'package:clean_dicoding_resto/domain/usecases/get_restaurant.dart';
import 'package:get/get.dart';

import '../../../domain/entities/restaurant.dart';

class RestaurantListController extends GetxController {
  final GetRestaurant getRestaurant;

  RestaurantListController({
    required this.getRestaurant,
  });

  List<Restaurant> _listResto = [];

  List<Restaurant> get listResto => _listResto;

  RequestState _listRestoState = RequestState.empty;

  RequestState get listRestoState => _listRestoState;

  void infoMessage(String massage) {
    Get.snackbar('Info', massage);
  }

  Future<void> fetchListResto() async {
    try {
      _listRestoState = RequestState.loading;

      final result = await getRestaurant.execute();

      result.fold((failur) {
        _listRestoState = RequestState.error;

        infoMessage(failur.message);
      }, (restaurantsData) {
        _listRestoState = RequestState.loaded;

        _listResto = restaurantsData;

        update();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchListResto();
  }
}
