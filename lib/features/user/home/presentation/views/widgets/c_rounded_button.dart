import 'package:flutter/material.dart';

import '../../../../../../core/constants.dart';

class CRoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const CRoundedButton({Key? key, required this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.withOpacity(0.4),
        gradient: LinearGradient(colors: [
          Colors.black.withOpacity(0.8),
          Colors.transparent,
        ], begin: Alignment.bottomCenter, end: Alignment.topRight),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: greyColor,
          size: 21,
        ),
      ),
    );
  }
}
