import 'package:flutter/material.dart';

import '../../../../../../core/widgets/text_13.dart';

class CCategoryFoodBox extends StatelessWidget {
  final String categoryName;
  const CCategoryFoodBox({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.4),
        gradient: LinearGradient(colors: [
          Colors.black.withOpacity(0.8),
          Colors.transparent,
        ], begin: Alignment.bottomCenter, end: Alignment.topRight),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/categories/$categoryName.png',
              width: 25, height: 25),
          const SizedBox(width: 4),
          Text13(text: categoryName, color: Colors.white)
        ],
      ),
    );
  }
}
