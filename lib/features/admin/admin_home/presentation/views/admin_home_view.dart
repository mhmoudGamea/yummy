import 'package:flutter/material.dart';

import 'widgets/admin_home_view_body.dart';

class AdminHomeView extends StatelessWidget {
  static const String rn = '/adminHomeView';
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AdminHomeViewBody(),
      ),
    );
  }
}
