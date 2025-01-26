import 'package:flutter/material.dart';

import '../../../../../../../core/utils/styles.dart';

class UserDrawerItem extends StatelessWidget {
  const UserDrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTapped});
  final String title;
  final IconData icon;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Styles.title15,
      ),
      leading: Icon(
        icon,
        size: 22,
      ),
      onTap: onTapped,
    );
  }
}
