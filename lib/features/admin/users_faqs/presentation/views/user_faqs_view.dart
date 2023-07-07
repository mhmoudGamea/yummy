import 'package:flutter/material.dart';
import 'package:yummy/features/admin/users_faqs/presentation/views/widgets/user_faqs_view_body.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';

class UserFaqsView extends StatelessWidget {
  static const String rn = '/userFaqsView';
  const UserFaqsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.appBar(
          context: context, text: 'User Faqs', bgColor: primaryColor),
      body: const SafeArea(
        child: UserFaqsViewBody(),
      ),
    );
  }
}
