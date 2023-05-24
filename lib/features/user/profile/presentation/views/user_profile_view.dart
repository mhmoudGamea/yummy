import 'package:flutter/material.dart';

import 'widgets/user_profile_view_body.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: UserProfileViewBody()));
  }
}
