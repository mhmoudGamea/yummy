import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/chat/presentation/model_views/chat_cubit/chat_cubit.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/styles.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF4F6F8),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        controller: context.read<ChatCubit>().messageController,
        decoration: InputDecoration(
          hintText: 'Type a message',
          hintStyle: Styles.title14.copyWith(color: AppColors.greyColor2),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
