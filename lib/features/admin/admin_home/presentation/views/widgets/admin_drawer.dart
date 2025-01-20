import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/features/admin/categories/presentation/views/category_view.dart';
import 'package:yummy/features/admin/food/presentation/views/food_view.dart';
import 'package:yummy/features/admin/users_faqs/presentation/views/user_faqs_view.dart';
import 'package:yummy/features/welcome/presentation/views/welcome_view.dart';

import '../../../../../../core/constants.dart';
import '../../../../banners/presentation/views/banner_manage_view.dart';
import 'drawer_image.dart';
import 'drawer_item.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      elevation: 4,
      shadowColor: greyColor,
      child: Column(
        children: [
          const DrawerImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                DrawerItem(
                  text: 'Banners',
                  icon: FontAwesomeIcons.flag,
                  onPress: () {
                    GoRouter.of(context).push(BannerManageView.rn);
                    Scaffold.of(context).closeDrawer();
                  },
                ),
                DrawerItem(
                  text: 'Categories',
                  icon: FontAwesomeIcons.layerGroup,
                  onPress: () {
                    GoRouter.of(context).push(CategoryView.rn);
                    Scaffold.of(context).closeDrawer();
                  },
                ),
                DrawerItem(
                  text: 'Food',
                  icon: FontAwesomeIcons.burger,
                  onPress: () {
                    GoRouter.of(context).push(FoodView.rn);
                    Scaffold.of(context).closeDrawer();
                  },
                ),
                DrawerItem(
                  text: 'Users Faqs',
                  icon: FontAwesomeIcons.user,
                  onPress: () {
                    GoRouter.of(context).push(UserFaqsView.rn);
                    Scaffold.of(context).closeDrawer();
                  },
                ),
                DrawerItem(
                  text: 'send notification',
                  icon: FontAwesomeIcons.bell,
                  onPress: () {
                    print('Banners');
                  },
                ),
                DrawerItem(
                  text: 'settings',
                  icon: FontAwesomeIcons.gears,
                  onPress: () {
                    print('Banners');
                  },
                ),
                DrawerItem(
                  text: 'exit',
                  icon: FontAwesomeIcons.arrowRightFromBracket,
                  onPress: () {
                    FirebaseAuth.instance.signOut();
                    GoRouter.of(context).push(WelcomeView.rn);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
