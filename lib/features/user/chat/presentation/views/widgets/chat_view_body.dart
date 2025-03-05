import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/features/user/chat/presentation/model_views/chat_cubit/chat_cubit.dart';
import 'package:yummy/features/user/chat/presentation/model_views/chat_cubit/chat_state.dart';

import '../../../data/models/agora_config_model.dart';
import 'chat_bottom_row.dart';
import 'chat_bubble.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key, required this.receiverUid});

  final String receiverUid;

  @override
  Widget build(BuildContext context) {
    // final AgoraConfigModel agoraConfigModel =
    //     GetIt.instance<AgoraConfigModel>();

    final chatCubit = BlocProvider.of<ChatCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          final messageList = BlocProvider.of<ChatCubit>(context).messageList;
          // print(messageList.length);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: chatCubit.scrollController,
                  itemBuilder: (context, index) => ChatBubble(
                    message: messageList[index].message,
                    isMe: chatCubit.uId == messageList[index].sender,
                  ),
                  itemCount: messageList.length,
                ),
              ),
              SizedBox(height: 16),
              ChatBottomRow(receiverUid: receiverUid),
              SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
