import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class BoardViewBody extends StatefulWidget {
  const BoardViewBody({Key? key}) : super(key: key);

  @override
  State<BoardViewBody> createState() => _BoardViewBodyState();
}

class _BoardViewBodyState extends State<BoardViewBody> {
  final PageController _controller = PageController(initialPage: 0);
  final List<Widget> _pages = [
    Column(
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/onBoard/map.png',
            width: 200,
          ),
        ),
        const Text('Set your delivery location', style: Styles.title16),
      ],
    ),
    Column(
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/onBoard/order.png',
            width: 200,
          ),
        ),
        const FittedBox(
          child: Text('Order online from your favourite resturant',
              style: Styles.title16),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/onBoard/delivery.png',
            width: 200,
          ),
        ),
        const Text('Quick deliver to your doorstep', style: Styles.title16),
      ],
    ),
  ];
  var currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            children: _pages,
          ),
        ),
        const SizedBox(height: 20),
        SmoothPageIndicator(
          controller: _controller,
          count: _pages.length,
          effect: const ExpandingDotsEffect(
            dotHeight: 9,
            activeDotColor: primaryColor,
            dotColor: greyColor,
          ),
          onDotClicked: (index) {
            currentPage = index;
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
