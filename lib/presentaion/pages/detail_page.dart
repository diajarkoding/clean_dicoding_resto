import 'package:clean_dicoding_resto/common/state_enum.dart';
import 'package:clean_dicoding_resto/presentaion/controller/restaurant_detail/restaurant_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constans.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/menu.dart';
import '../../domain/entities/restaurant_detail.dart';
import '../widget/category_card.dart';
import '../widget/custom_button.dart';
import '../widget/menus_card.dart';

class DetailPage extends StatelessWidget {
  final String id;
  DetailPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  final restoController = Get.find<RestaurantDetailController>();

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage(String id) {
      return Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'https://restaurant-api.dicoding.dev/images/medium/$id',
              ),
              fit: BoxFit.cover),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 170,
        margin: const EdgeInsets.only(
          top: 230,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(1.0),
            ],
          ),
        ),
      );
    }

    Widget nameCityRating(String name, String city, double rating) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          defaultMargin,
          260,
          defaultMargin,
          0,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '$city, Indonesia',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 7.5,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_star_1.png',
                    width: 16,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    rating.toString(),
                    style: blackTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget description(String text) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              text,
              style: blackTextStyle.copyWith(fontWeight: reguler),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    Widget category(List<Category> categories) {
      return Padding(
        padding: const EdgeInsets.only(left: defaultMargin, top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children:
                  categories.map((e) => CategoryCard(text: e.name)).toList(),
            ),
          ],
        ),
      );
    }

    Widget foods(Menus menus) {
      return Padding(
        padding: const EdgeInsets.only(left: defaultMargin, top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Makanan',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Column(
                children:
                    menus.foods.map((e) => MenusWidget(text: e.name)).toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget drinks(Menus menus) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          defaultMargin,
          0,
          defaultMargin,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Minuman',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Column(
                children: menus.drinks
                    .map(
                      (e) => MenusWidget(
                        text: e.name,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget reviewButton() {
      return CustomButton(
        text: 'Tulis Review',
        width: 0.2,
        onPressed: () {},
        icon: Icons.reviews,
      );
    }

    // Widget lineDivider() {
    //   return const Padding(
    //     padding: EdgeInsets.symmetric(
    //       horizontal: defaultMargin,
    //       vertical: defaultMargin,
    //     ),
    //     child: Divider(
    //       color: Colors.black,
    //       thickness: 0.2,
    //     ),
    //   );
    // }

    // Widget reviewResult(List<CustomerReviewResult> customerReviewResult) {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(
    //           left: defaultMargin,
    //         ),
    //         child: Text(
    //           'Review Customer',
    //           style:
    //               blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
    //         ),
    //       ),
    //       Column(
    //         children: customerReviewResult
    //             .map(
    //               (e) => ReviewResultCard(
    //                   name: e.name, date: e.date, review: e.review),
    //             )
    //             .toList(),
    //       ),
    //     ],
    //   );
    // }

    Widget content(
      String name,
      String city,
      double rating,
      String text,
      Menus menus,
      List<Category> categories,
      // List<CustomerReviewResult> customerReviewResult,
      // RestaurantDetail resto
    ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nameCityRating(name, city, rating),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: defaultMargin),
            padding: const EdgeInsets.symmetric(
              vertical: defaultMargin,
            ),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                description(text),
                category(categories),
                foods(
                  menus,
                ),
                drinks(
                  menus,
                ),
                reviewButton(),
                // lineDivider(),
                // reviewResult(customerReviewResult),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: GetBuilder<RestaurantDetailController>(
        init: restoController,
        initState: (_) async {
          await restoController.fetchRestoDetail(id);
        },
        builder: (_) {
          final restaurantDetail = restoController.restaurantDetail;
          final state = restoController.restaurantDetailState;
          if (state == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state == RequestState.loaded) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  backgroundImage(restaurantDetail!.pictureId),
                  customShadow(),
                  content(
                    restaurantDetail.name,
                    restaurantDetail.city,
                    restaurantDetail.rating,
                    restaurantDetail.description,
                    restaurantDetail.menus,
                    restaurantDetail.categories,
                    // restaurantDetail.customerReviews,
                    // restaurantDetail,
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Tidak ada'));
          }
          // return SingleChildScrollView(
          //   child: Stack(
          //     children: [
          //       backgroundImage(restaurantDetail.pictureId),
          //       customShadow(),
          //       content(
          //         restaurantDetail.name,
          //         restaurantDetail.city,
          //         restaurantDetail.rating,
          //         restaurantDetail.description,
          //         restaurantDetail.menus,
          //         restaurantDetail.categories,
          //         // restaurantDetail.customerReviews,
          //         // restaurantDetail,
          //       ),
          //     ],
          //   ),
          // );
          // return FutureBuilder<RestaurantDetail>(
          //   future: restoController.fetchRestoDetail(id),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     if (snapshot.hasData) {
          //       RestaurantDetail restaurantDetail = snapshot.data!;

          //       return SingleChildScrollView(
          //         child: Stack(
          //           children: [
          //             backgroundImage(restaurantDetail.pictureId),
          //             customShadow(),
          //             content(
          //               restaurantDetail.name,
          //               restaurantDetail.city,
          //               restaurantDetail.rating,
          //               restaurantDetail.description,
          //               restaurantDetail.menus,
          //               restaurantDetail.categories,
          //               restaurantDetail.customerReviews,
          //               restaurantDetail,
          //             ),
          //           ],
          //         ),
          //       );
          //     }
          //     return const Center(
          //       child: Text('Tidak ada data'),
          //     );
          //   },
          // );
        },
      ),
    );
  }
}
