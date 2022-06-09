import 'package:clean_dicoding_resto/common/state_enum.dart';
import 'package:clean_dicoding_resto/presentaion/controller/restaurant/restaurant_list_controller.dart';
import 'package:clean_dicoding_resto/presentaion/widget/resto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/constans.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // final RestaurantListController c = Get.find<RestaurantListController>();

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hallo,',
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Foodies',
                            style: greenTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                            children: [
                              TextSpan(
                                text: ' ...',
                                style: blackTextStyle.copyWith(
                                  fontSize: 24,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Hero(
                    tag: 'search',
                    child: Icon(
                      Icons.search,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Cari & Temukan Restoran Favoritmu',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      );
    }

    Widget gridViewResto() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: defaultMargin,
              bottom: defaultMargin,
            ),
            child: Text(
              'Daftar Restoran',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          GetBuilder<RestaurantListController>(
            // init: Get.find<RestaurantListController>(),
            // initState: (_) {},
            builder: (c) {
              final state = c.listRestoState;
              if (state == RequestState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.loaded) {
                return GridView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 18,
                  ),
                  children: c.listResto
                      .map((e) => RestoCard(
                            resto: e,
                          ))
                      .toList(),
                );
              } else {
                return const Center(child: Text('Tidak ada'));
                // return GridView(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: defaultMargin,
                //   ),
                //   physics: const NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     childAspectRatio: 0.7,
                //     crossAxisSpacing: 18,
                //   ),
                //   children: c.listResto
                //       .map((e) => RestoCard(
                //             resto: e,
                //           ))
                //       .toList(),
                // );
              }
            },
          )
        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          gridViewResto(),
        ],
      ),
    );
  }
}
