import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/utils/helper.dart';
import 'package:yummy/features/user/chat/presentation/model_views/chat_cubit/chat_cubit.dart';

import '../../domain/repos/chat_repo/chat_repo_impl.dart';
import 'widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  static const rn = '/chatView';
  const ChatView({super.key, required this.receiverUid});

  final String receiverUid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatCubit(ChatRepoImpl())..getMessages(receiverUid: receiverUid),
      child: Scaffold(
        appBar: Helper.appBar(
          context: context,
          text: 'Chat',
          bgColor: Colors.white,
          textColor: Colors.black,
          elevation: 2,
          iconColor: Colors.black,
          trailing: true,
        ),
        body: SafeArea(child: ChatViewBody(receiverUid: receiverUid)),
      ),
    );
  }
}
