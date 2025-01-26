import 'package:flutter/material.dart';

import 'c_image_box.dart';
import 'c_location_box.dart';
import 'cart_widget.dart';

class CAppBar extends StatelessWidget {
  const CAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          GestureDetector(
              onTap: () async {
                Scaffold.of(context).openDrawer();
              },
              child: const CImageBox(imagePath: 'assets/images/splash.png')),
          const SizedBox(width: 10),
          const CLocationBox(),
          const SizedBox(width: 10),
          const CartWidget(),
        ],
      ),
    );
  }
}
