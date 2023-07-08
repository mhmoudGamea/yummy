import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/cart_widget.dart';
import 'package:yummy/features/welcome/presentation/views/welcome_view.dart';

import 'c_image_box.dart';
import 'c_location_box.dart';

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
                // GetIt get = GetIt.I;
                FirebaseAuth.instance.signOut();
                GoRouter.of(context).push(WelcomeView.rn);
                // SharedPreferences prefs = get.get<SharedPreferences>();
                // await prefs.clear();
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
