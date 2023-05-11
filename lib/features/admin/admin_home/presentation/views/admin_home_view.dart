import 'package:flutter/material.dart';
import 'package:yummy/core/constants.dart';

import '../../../../../core/utils/styles.dart';
import 'widgets/admin_drawer.dart';
import 'widgets/admin_home_view_body.dart';

class AdminHomeView extends StatelessWidget {
  static const String rn = '/adminHomeView';
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // leading: Builder(
        //   builder: (context) {
        //     return IconButton(
        //         onPressed: () {
        //           Scaffold.of(context).openDrawer();
        //         },
        //         icon: const Icon(
        //           Icons.menu_rounded,
        //           size: 23,
        //         ));
        //   },
        // ),
        backgroundColor: primaryColor,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Admin Dashboard',
          style: Styles.title16.copyWith(color: Colors.white),
        ),
      ),
      body: const SafeArea(
        child: AdminHomeViewBody(),
      ),
      drawer: const AdminDrawer(),
    );
  }
}
