import 'package:flutter/material.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/styles.dart';

class UserNumber extends StatelessWidget {
  final String? name;
  final String? phone;
  const UserNumber({super.key, required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name ?? 'Un Known', style: Styles.title16),
        const SizedBox(height: 5),
        Text(phone ?? '***********',
            style: Styles.title13.copyWith(color: AppColors.greyColor2)),
      ],
    );
  }
}
