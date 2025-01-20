import 'package:flutter/material.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';

class UserProfileAccount extends StatelessWidget {
  final String? name;
  final String? phone;
  const UserProfileAccount(
      {super.key, required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name ?? 'Un Known', style: Styles.title16),
        const SizedBox(height: 5),
        Text(phone ?? '***********',
            style: Styles.title13.copyWith(color: greyColor2)),
      ],
    );
  }
}
