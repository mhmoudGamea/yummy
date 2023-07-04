import 'package:flutter/material.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';

class UserProfileAccount extends StatelessWidget {
  const UserProfileAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Margot Robbie', style: Styles.title16),
        const SizedBox(height: 5),
        Text('+20:-----------',
            style: Styles.title13.copyWith(color: greyColor2)),
      ],
    );
  }
}
