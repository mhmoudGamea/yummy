import 'package:flutter/material.dart';

import 'widgets/welcome_view_body.dart';

class WelcomeView extends StatelessWidget {
  static const String rn = '/welcomeView';
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WelcomeViewBody(),
      ),
    );
  }
}
