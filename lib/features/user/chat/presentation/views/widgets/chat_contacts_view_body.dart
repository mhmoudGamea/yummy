import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../model_views/chat_cubit/chat_cubit.dart';
import '../chat_view.dart';
import 'chat_contact_item.dart';

class ChatContactsViewBody extends StatelessWidget {
  const ChatContactsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // log(context.watch<ChatCubit>().contactsList.length.toString());
    final chatCubit = context.watch<ChatCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) =>
                  chatCubit.uId == chatCubit.contactsList[index].uid
                      ? SizedBox()
                      : ChatContactItem(
                          onTap: () {
                            GoRouter.of(context).push(ChatView.rn,
                                extra: chatCubit.contactsList[index].uid);
                          },
                          userModel: chatCubit.contactsList[index],
                        ),
              itemCount: chatCubit.contactsList.length,
            ),
          ),
        ],
      ),
    );
  }
}
