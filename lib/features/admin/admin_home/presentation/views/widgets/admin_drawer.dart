import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/features/welcome/presentation/views/welcome_view.dart';

import '../../../../../../core/constants.dart';
import '../../../../banners/presentation/views/banner_manage_view.dart';
import 'drawer_image.dart';
import 'drawer_item.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

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
                    print('Banners');
                  },
                ),
                DrawerItem(
                  text: 'Admin Users',
                  icon: FontAwesomeIcons.user,
                  onPress: () {
                    print('Banners');
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
