import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(75),
          ),
        )
      ],
    );
  }
}
