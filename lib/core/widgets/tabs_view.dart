import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/features/user/favourite/presentation/views/favourite_view.dart';
import 'package:yummy/features/user/profile/presentation/views/user_profile_view.dart';
import 'package:yummy/features/user/search/presentation/views/user_search_view.dart';

import '../../features/user/home/presentation/views/home_view.dart';

class TabsView extends StatelessWidget {
  static const String rn = '/tabsView';
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    List<Widget> buildScreens() {
      return [
        const HomeView(),
        const FavouriteView(),
        const UserSearchView(),
        const UserProfileView(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Image.asset(
            'assets/images/splash.png',
            width: 20,
          ),
          title: ("Home"),
          activeColorSecondary: black,
          textStyle: Styles.title15,
          activeColorPrimary: greyColor.withOpacity(0.4),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.favorite_border_rounded,
            size: 17,
          ),
          title: ("Favourite"),
          activeColorSecondary: black,
          textStyle: Styles.title15,
          activeColorPrimary: greyColor.withOpacity(0.4),
          inactiveColorPrimary: black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.search_rounded,
            size: 19,
          ),
          title: ("Search"),
          activeColorSecondary: black,
          textStyle: Styles.title15,
          activeColorPrimary: greyColor.withOpacity(0.4),
          inactiveColorPrimary: black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.person_outline_rounded,
            size: 19,
          ),
          title: ("Profile"),
          activeColorSecondary: black,
          textStyle: Styles.title15,
          activeColorPrimary: greyColor.withOpacity(0.4),
          inactiveColorPrimary: black,
        ),
      ];
    }

    return Scaffold(
      body: PersistentTabView(
        context,
        controller: controller,
        screens: buildScreens(),
        items: navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              color: greyColor.withOpacity(0.4),
              offset: const Offset(0, -1),
            ),
          ],
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style10, // Choose the nav bar style with this property.
      ),
    );
  }
}
