import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/core/constants.dart';

import '../../../../../core/utils/styles.dart';
import 'widgets/admin_drawer.dart';
import 'widgets/admin_home_view_body.dart';

class AdminHomeView extends StatelessWidget {
  static const String rn = '/adminHomeView';
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                FontAwesomeIcons.bars,
                size: 20,
                color: Colors.white,
              ),
            );
          },
        ),
        backgroundColor: primaryColor,
        elevation: 2,
        shadowColor: greyColor,
        centerTitle: true,
        title: Text(
          'Admin',
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
