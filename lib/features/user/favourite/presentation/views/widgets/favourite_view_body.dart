import 'package:flutter/material.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 180,
            height: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://images.herzindagi.info/image/2022/Apr/burger-tasty.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            width: 180,
            height: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.6),
                Colors.transparent,
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
          ),
          Positioned(
            top: 15,
            left: 12,
            child: Container(
              height: 30,
              width: 105,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.4),
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/category/fastFood.png',
                      width: 25, height: 25),
                  const SizedBox(width: 4),
                  Text(
                    'Fast Food',
                    style: Styles.title13.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 12,
            child: SizedBox(
              width: 120,
              child: Text(
                'Milky Cheese Burger',
                style: Styles.title16
                    .copyWith(color: Colors.white, overflow: TextOverflow.fade),
                maxLines: 3,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 12,
            child: SizedBox(
              width: 120,
              child: Row(
                children: [
                  Text(
                    '30 Min',
                    style: Styles.title13.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '|',
                    style: Styles.title13.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '1 Serving',
                    style: Styles.title13.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 12,
            bottom: 15,
            child: Container(
              height: 30,
              width: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.withOpacity(0.4),
              ),
              child: GestureDetector(
                onTap: () {
                  print('يارب');
                },
                child: const Icon(
                  Icons.favorite,
                  color: greyColor,
                  size: 21,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
