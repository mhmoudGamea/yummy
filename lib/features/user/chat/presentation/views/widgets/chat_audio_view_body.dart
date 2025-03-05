import 'package:flutter/material.dart';
import 'package:yummy/core/models/user_model.dart';

import '../../../../../../core/utils/styles.dart';

class ChatAudioViewBody extends StatelessWidget {
  final UserModel userModel;
  const ChatAudioViewBody({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 15),
          Container(
            height: 120,
            width: 120,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: const Color(0xFFE7E4E4),
            ),
            child: (userModel.profileImage!.isEmpty ||
                    userModel.profileImage == null)
                ? Icon(Icons.person, size: 50, color: Color(0xFFB2AFAF))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.network(userModel.profileImage!,
                        fit: BoxFit.cover),
                  ),
          ),
          SizedBox(height: 10),
          Text(userModel.name!, style: Styles.title15),
          SizedBox(height: 10),
          Text(userModel.phoneNumber, style: Styles.title14),
          Spacer(),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.phone,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
