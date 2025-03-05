import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/features/user/chat/presentation/views/chat_audio_view.dart';
import 'package:yummy/features/user/chat/presentation/views/widgets/chat_button.dart';

import '../../model_views/chat_cubit/chat_cubit.dart';
import 'message_text_field.dart';

class ChatBottomRow extends StatelessWidget {
  const ChatBottomRow({super.key, required this.receiverUid});

  final String receiverUid;

  @override
  Widget build(BuildContext context) {
    final chatCubit = BlocProvider.of<ChatCubit>(context);

    return Row(
      children: [
        Expanded(
          child: MessageTextField(),
        ),
        SizedBox(width: 5),
        ChatButton(
            onTapped: () {
              chatCubit.sendMessage(receiverUid);
            },
            icon: FontAwesomeIcons.paperPlane),
        SizedBox(width: 5),
        ChatButton(
            onTapped: () {
              GoRouter.of(context).push(ChatAudioView.rn, extra: receiverUid);
            },
            icon: FontAwesomeIcons.microphoneLines),
      ],
    );
  }
}
