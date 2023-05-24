import 'package:flutter/material.dart';

import '../../../../../../core/constants.dart';

class SelectProfileImageButton extends StatelessWidget {
  const SelectProfileImageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1.2, color: primaryColor),
      ),
      child: IconButton(
        constraints: const BoxConstraints(),
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: const Icon(Icons.image_outlined, size: 18, color: primaryColor),
      ),
    );
  }
}
