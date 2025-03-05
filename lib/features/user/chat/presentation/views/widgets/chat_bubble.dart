import 'package:flutter/material.dart';
import 'package:yummy/core/utils/styles.dart';

import '../../../../../../core/config/app_colors.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                color: isMe ? AppColors.primaryColor : Color(0xFFF4F6F8),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(8),
                  topRight: const Radius.circular(8),
                  bottomRight: isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(8),
                  bottomLeft: isMe
                      ? const Radius.circular(8)
                      : const Radius.circular(0),
                )),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.60),
            child: Text(
              message,
              style: Styles.title15
                  .copyWith(color: isMe ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
