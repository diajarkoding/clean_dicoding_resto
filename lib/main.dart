import 'dart:io';
import 'package:clean_dicoding_resto/presentaion/controller/restaurant/restaurant_list_controller.dart';
import 'package:clean_dicoding_resto/presentaion/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/util/certificate.dart';
import 'common/util/depedency.dart';
import 'injection.dart' as di;

void main() {
  DependencyCreator.init();
  // di.init();
  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // final RestaurantListController restaurantListController =
  //     Get.put(RestaurantListController(getRestaurant: Get.find()));
  // final RestaurantListController restaurantListController =
  //     Get.put(di.locator<RestaurantListController>());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: '/',
      // initialBinding: RestaurantBinding(),
      home: HomePage(),
    );
  }
}
