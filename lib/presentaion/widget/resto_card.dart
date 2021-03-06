import 'package:clean_dicoding_resto/data/models/restaurant_model.dart';
import 'package:clean_dicoding_resto/domain/entities/restaurant.dart';
import 'package:clean_dicoding_resto/presentaion/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constans.dart';

class RestoCard extends StatelessWidget {
  final Restaurant resto;
  // final int index;

  const RestoCard({
    Key? key,
    required this.resto,
    // required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => DetailPage(
            id: resto.id,
          ),
          // arguments: resto.id,
        );
        print(resto.id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                    'https://restaurant-api.dicoding.dev/images/medium/${resto.pictureId}'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 65,
                margin: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_star_1.png',
                      width: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      resto.rating.toString(),
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              resto.name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              text: resto.city,
              style: greenTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
              children: [
                TextSpan(
                  text: ' Indonesia',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
