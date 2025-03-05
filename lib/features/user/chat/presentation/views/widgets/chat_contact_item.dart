import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/models/user_model.dart';
import '../../../../../../core/utils/styles.dart';

class ChatContactItem extends StatelessWidget {
  const ChatContactItem(
      {super.key, required this.userModel, required this.onTap});
  final UserModel userModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    print(userModel.phoneNumber);
    print(userModel.uid);
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.white),
              color: Color.fromARGB(255, 211, 219, 228),
            ),
            child: (userModel.profileImage == null ||
                    userModel.profileImage!.isEmpty)
                ? Icon(
                    FontAwesomeIcons.user,
                    size: 25,
                    color: Color(0xFFF4F6F8),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      userModel.profileImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          const SizedBox(width: 10),
          Text(
              (userModel.name == null || userModel.name!.isEmpty)
                  ? userModel.phoneNumber
                  : userModel.name!,
              style: Styles.title14),
        ],
      ),
    );
  }
}
