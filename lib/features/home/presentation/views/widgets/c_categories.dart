import 'package:flutter/material.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/features/home/presentation/views/widgets/c_header_name.dart';

import '../../../../../core/constants.dart';

class CCategories extends StatelessWidget {
  const CCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> list = [
      {
        'image': Image.asset(
          'assets/images/category/fastFood.png',
          width: 35,
        ),
        'title': 'Fast Food'
      },
      {
        'image': Image.asset(
          'assets/images/category/snack.png',
          width: 35,
        ),
        'title': 'Snack'
      },
      {
        'image': Image.asset(
          'assets/images/category/drink.png',
          width: 35,
        ),
        'title': 'Drink'
      },
      {
        'image': Image.asset(
          'assets/images/category/desert.png',
          width: 35,
        ),
        'title': 'Desert'
      },
      {
        'image': Image.asset(
          'assets/images/category/soup.png',
          width: 35,
        ),
        'title': 'Soup'
      },
      {
        'image': Image.asset(
          'assets/images/category/salad.png',
          width: 35,
        ),
        'title': 'Salad'
      },
      {
        'image': Image.asset(
          'assets/images/category/sauce.png',
          width: 35,
        ),
        'title': 'Sauce'
      },
      {
        'image': Image.asset(
          'assets/images/category/pizza.png',
          width: 35,
        ),
        'title': 'Pizza'
      },
      {
        'image': Image.asset(
          'assets/images/category/pasta.png',
          width: 35,
        ),
        'title': 'Pasta'
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CHeaderName(name: 'Categories'),
        const SizedBox(height: 10),
        SizedBox(
          height: 55,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) => Column(
              children: [
                list[index]['image'],
                const SizedBox(height: 5),
                Text(
                  list[index]['title'],
                  style: Styles.title13.copyWith(color: greyColor2),
                ),
              ],
            ),
            itemCount: list.length,
          ),
        ),
      ],
    );
  }
}
